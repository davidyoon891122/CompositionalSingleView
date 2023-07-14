//
//  ProductCell.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/06.
//

import UIKit
import SnapKit

final class ProductCell: UICollectionViewCell {
    static let identifier = "ProductCell"
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wework")
        
        imageView.layer.cornerRadius = 12.0
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "역삼 위워크"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14.0)
        
        return label
    }()
    
    private lazy var pricePercentLabel: UILabel = {
        let label = UILabel()
        label.text = "+5.75%"
        label.textColor = .red
        label.font = .systemFont(ofSize: 14.0)
        
        return label
    }()
    
    private lazy var topLabelView: UIView = {
        let view = UIView()
        [
            nameLabel,
            pricePercentLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        pricePercentLabel.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel)
            $0.trailing.equalToSuperview()
        }
        
        pricePercentLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "4,850 원"
        label.textColor = .label
        
        return label
    }()
    
    private lazy var priceValueLabel: UILabel = {
        let label = UILabel()
        label.text = "+250 원"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    private lazy var bottomLabelView: UIView = {
        let view = UIView()
        [
            priceLabel,
            priceValueLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        priceValueLabel.snp.makeConstraints {
            $0.centerY.equalTo(priceLabel)
            $0.trailing.equalToSuperview()
        }
        
        priceValueLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return view
    }()
    
    private lazy var labelView: UIView = {
        let view = UIView()
        [
            topLabelView,
            bottomLabelView
        ]
            .forEach {
                view.addSubview($0)
            }
        let offset: CGFloat = 4.0
        topLabelView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        bottomLabelView.snp.makeConstraints {
            $0.top.equalTo(topLabelView.snp.bottom).offset(offset)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        return view
    }()
    
    private let seperatorView = SeparatorView(height: 0.3, color: .lightGray.withAlphaComponent(0.5))
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        [
            productImageView,
            labelView,
            seperatorView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        
        productImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(offset)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-offset)
            $0.width.height.equalTo(50.0)
        }
        
        labelView.snp.makeConstraints {
            $0.centerY.equalTo(productImageView)
            $0.leading.equalTo(productImageView.snp.trailing).offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
        }
        
        seperatorView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        return view
    }()
    
    private var settingViewModel: SettingViewModelType!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(product: ProductModel) {
        nameLabel.text = product.name
        pricePercentLabel.text = "\(product.priceValuePercent)%"
        priceLabel.text = "\(product.price) 원"
        priceValueLabel.text = "+\(product.priceValue) 원"
        productImageView.image = UIImage(named: product.imageName)
    }
    
    func setViewModel(viewModel: SettingViewModelType) {
        self.settingViewModel = viewModel
    }
}

private extension ProductCell {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16.0)
            $0.trailing.equalToSuperview().offset(-16.0)
            $0.bottom.equalToSuperview()
        }
    }
}
