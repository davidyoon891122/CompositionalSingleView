//
//  SettingViewController.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/06.
//

import UIKit
import SnapKit

enum SettingSectionType {
    case account
    case product
}

final class SettingViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AccountCell.self, forCellWithReuseIdentifier: AccountCell.identifier)
        
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
        
        collectionView.backgroundColor = .secondarySystemBackground
        
        return collectionView
    }()
    
    private var datasource: UICollectionViewDiffableDataSource<SettingSectionType, AnyHashable>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureNaivigation()
        configureDatasource()
    }
}

private extension SettingViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        [
            collectionView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func configureNaivigation() {
        navigationItem.title = "계좌 개설"
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            if sectionIndex == 0 {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(350)))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(350)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            } else if sectionIndex == 1 {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(70)))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(70)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            } else {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(350)))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(350)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            }
        })
        
        return layout
    }
    
    func configureDatasource() {
        datasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            if indexPath.section == 0 {
                if let _ = item as? AccountModel {
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountCell.identifier, for: indexPath) as? AccountCell else { return UICollectionViewCell() }
                    
                    return cell
                } else if let _ = item as? EmptyAccountModel {
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountCell.identifier, for: indexPath) as? AccountCell else { return UICollectionViewCell() }
                        
                    return cell
                } else {
                    return UICollectionViewCell()
                }
            } else if indexPath.section == 1 {
                if let _ = item as? ProductModel {
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else { return UICollectionViewCell() }
                    return cell
                } else {
                    return UICollectionViewCell()
                }
            } else {
                return UICollectionViewCell()
            }
        })
        
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<SettingSectionType, AnyHashable>()
        snapshot.appendSections([.account, .product])
        snapshot.appendItems(EmptyAccountModel.item, toSection: .account)
        snapshot.appendItems(ProductModel.items, toSection: .product)
        
        datasource.apply(snapshot, animatingDifferences: true)
    }
}
