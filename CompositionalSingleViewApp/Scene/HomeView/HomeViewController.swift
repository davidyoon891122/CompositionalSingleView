//
//  HomeViewController.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/06/30.
//

import UIKit
import SnapKit

enum SectionType {
    case banner
    case ticker
    case news
}

struct Section {
    let type: SectionType
    var items: [AnyHashable]
}

class HomeViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(
            BannerHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: BannerHeaderView.identifier
        )
        
        collectionView.register(
            BannerCell.self,
            forCellWithReuseIdentifier: BannerCell.identifier
        )
        
        collectionView.register(
            TickerHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: TickerHeaderView.identifier
        )
        
        collectionView.register(
            TickerCell.self,
            forCellWithReuseIdentifier: TickerCell.identifier
        )
        
        collectionView.register(
            NewsCell.self,
            forCellWithReuseIdentifier: NewsCell.identifier
        )
        
        return collectionView
    }()

    private var datasource: UICollectionViewDiffableDataSource<SectionType, AnyHashable>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureDatasource()
        configureNaivigation()
    }
}

private extension HomeViewController {
    func setupViews() {
        [
            collectionView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            if sectionIndex == 0 {
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50.0)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(300.0))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.boundarySupplementaryItems = [header]
                
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                return section
            } else if sectionIndex == 1 {
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50.0)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [header]
                
                return section
            } else if sectionIndex == 2 {
//                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50.0)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(40))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(40))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
//                section.boundarySupplementaryItems = [header]
                
                return section
            } else {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/5), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(300.0))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            }
        }, configuration: configuration)
        
        return layout
    }
    
    func configureDatasource() {
        datasource = UICollectionViewDiffableDataSource<SectionType, AnyHashable>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            if let bannerModel = item as? BannerModel {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.identifier, for: indexPath) as? BannerCell else { return UICollectionViewCell() }
                
                cell.setupCell(bannerModel: bannerModel)
                
                return cell
            } else if let tickerModel = item as? TickerModel {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TickerCell.identifier, for: indexPath) as? TickerCell else { return UICollectionViewCell() }
                
                cell.setupCell(tickerModel: tickerModel)
                
                return cell
            } else if let newsModel = item as? NewsModel {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell else { return UICollectionViewCell() }
                
                cell.setupCell(newsModel: newsModel)
                
                return cell
            } else {
                return UICollectionViewCell()
            }
        })
        
        datasource.supplementaryViewProvider = { (collectionView, kind, indexPath) -> UICollectionReusableView? in
            if indexPath.section == 0 {
                if kind == UICollectionView.elementKindSectionHeader {
                    guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BannerHeaderView.identifier, for: indexPath) as? BannerHeaderView else { return nil }
                    
                    return headerView
                } else {
                    return nil
                }
            } else if indexPath.section == 1 {
                if kind == UICollectionView.elementKindSectionHeader {
                    guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TickerHeaderView.identifier, for: indexPath) as? TickerHeaderView else { return nil }
                    
                    return headerView
                } else {
                    return nil
                }
            } else {
                return nil
            }
            
        }
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<SectionType, AnyHashable>()
        snapshot.appendSections([.banner, .ticker, .news])
        
        snapshot.appendItems(BannerModel.items, toSection: .banner)
        snapshot.appendItems(TickerModel.items, toSection: .ticker)
        snapshot.appendItems(NewsModel.items, toSection: .news)
        
        datasource.apply(snapshot, animatingDifferences: true)
    }
    
    func configureNaivigation() {
        navigationItem.title = "Home"
    }
}

