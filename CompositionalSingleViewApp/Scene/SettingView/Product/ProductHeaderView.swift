//
//  ProductHeaderView.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/07.
//

import UIKit
import SnapKit

final class ProductHeaderView: UICollectionReusableView {
    static let identifier = "ProductHeaderView"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "상승률 높은 순서"
        
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProductMenuCell.self, forCellWithReuseIdentifier: ProductMenuCell.identifier)
        
        collectionView.backgroundColor = .secondarySystemBackground
        
        collectionView.delegate = self
        
        return collectionView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        [
            titleLabel,
            collectionView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(offset)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(offset)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        return view
    }()
    
    private var datasource: UICollectionViewDiffableDataSource<Int, MenuModel>!
    
    private var viewModel: SettingViewModelType!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureDatasource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewModel(viewModel: SettingViewModelType) {
        self.viewModel = viewModel
    }
}

extension ProductHeaderView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = MenuModel.items[indexPath.row]
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        changeTitle(toItem: item.menuName)
        
        self.viewModel.inputs.requestProductDataByMenu(menu: ProductMenuType(rawValue: item.menuName) ?? .dividend)
    }
}

private extension ProductHeaderView {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(50.0), heightDimension: .estimated(70.0)))
            
            item.edgeSpacing = .init(leading: .fixed(8), top: .fixed(0), trailing: .fixed(0), bottom: .fixed(0))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(50.0), heightDimension: .estimated(70.0)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            section.orthogonalScrollingBehavior = .continuous
            
            return section
        })
        
        return layout
    }
    
    func configureDatasource() {
        datasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductMenuCell.identifier, for: indexPath) as? ProductMenuCell else { return UICollectionViewCell() }
            
            cell.setupCell(title: item.menuName)
            return cell
        })
        
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, MenuModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(MenuModel.items)
        
        datasource.apply(snapshot, animatingDifferences: true)
    }
    
    func changeTitle(toItem: String) {
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
            self.titleLabel.text = ""
            self.titleLabel.alpha = 0
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
                self.titleLabel.text = toItem
                self.titleLabel.alpha = 1
            })
        }, completion: { [weak self] _ in
            self?.titleLabel.text = toItem
        })
    }
}
