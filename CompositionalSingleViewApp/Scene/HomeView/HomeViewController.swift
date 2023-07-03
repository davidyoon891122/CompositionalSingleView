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
}

struct Section {
    let type: SectionType
    var items: [AnyHashable]
}

class HomeViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
        collectionView.register(TickerCell.self, forCellWithReuseIdentifier: TickerCell.identifier)
        
        return collectionView
    }()

    private var datasource: UICollectionViewDiffableDataSource<SectionType, AnyHashable>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureDatasource()
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
            $0.edges.equalToSuperview()
        }
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            if sectionIndex == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(300.0))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                return section
            } else if sectionIndex == 1 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            } else {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/5), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(300.0))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            }
        })
        
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
            } else {
                return UICollectionViewCell()
            }
        })
        
        applySnapshot()
        
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<SectionType, AnyHashable>()
        snapshot.appendSections([.banner, .ticker])
        snapshot.appendItems(BannerModel.items, toSection: .banner)
        snapshot.appendItems(TickerModel.items, toSection: .ticker)
        
        datasource.apply(snapshot, animatingDifferences: true)
    }
}

