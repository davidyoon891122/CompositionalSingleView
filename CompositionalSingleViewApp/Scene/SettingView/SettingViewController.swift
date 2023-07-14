//
//  SettingViewController.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/06.
//

import UIKit
import SnapKit
import Combine

enum SettingSectionType {
    case account
    case product
}

final class SettingViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AccountCell.self, forCellWithReuseIdentifier: AccountCell.identifier)
        
        collectionView.register(
            ProductHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ProductHeaderView.identifier
        )
        
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
        
        collectionView.backgroundColor = .secondarySystemBackground
        
        return collectionView
    }()
    
    private var datasource: UICollectionViewDiffableDataSource<SettingSectionType, AnyHashable>!
    
    private var viewModel: SettingViewModelType = SettingViewModel()
    
    private var subscriptions = Set<AnyCancellable>()
    
    private var productData: [ProductModel] = ProductModel.items
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureNaivigation()
        configureDatasource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindViewModel()
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
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100.0)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(82)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.boundarySupplementaryItems = [header]
                
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
        datasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, item in
            guard let self = self else { return UICollectionViewCell() }
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
                if let productModel = item as? ProductModel {
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else { return UICollectionViewCell() }
                    cell.setViewModel(viewModel: self.viewModel)
                    
                    cell.setupCell(product: productModel)
                    return cell
                } else {
                    return UICollectionViewCell()
                }
            } else {
                return UICollectionViewCell()
            }
        })
        
        datasource.supplementaryViewProvider = { [weak self] (collectionView, kind, indexPath) -> UICollectionReusableView? in
            guard let self = self else { return nil }
            if indexPath.section == 1 {
                if kind == UICollectionView.elementKindSectionHeader {
                    guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProductHeaderView.identifier, for: indexPath) as? ProductHeaderView else { return nil }
                    
                    headerView.setViewModel(viewModel: self.viewModel)
                    return headerView
                }
                return nil
            } else {
                return nil
            }
        }
        
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<SettingSectionType, AnyHashable>()
        snapshot.appendSections([.account, .product])
        snapshot.appendItems(EmptyAccountModel.item, toSection: .account)
        snapshot.appendItems(productData, toSection: .product)
        
        datasource.apply(snapshot, animatingDifferences: true)
    }
    
    func bindViewModel() {
        self.viewModel.outputs.productModelSubject
            .sink(receiveCompletion: {
                print("Completed: \($0)")
            }, receiveValue: { [weak self] productData in
                guard let self = self else { return }
                self.productData = productData
                self.applySnapshot()
            })
            .store(in: &subscriptions)
    }
}
