//
//  BannerCell.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/06/30.
//

import UIKit
import SnapKit

final class BannerCell: UICollectionViewCell {
    static let identifier = "BannerCell"
    
    private lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrowshape.turn.up.forward")
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "The Banner has appeared"
        label.textColor = .label
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 8.0
        
        [
            bannerImageView,
            titleLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        bannerImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(250.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(offset)
            $0.bottom.equalToSuperview().offset(-offset)
        }
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(bannerModel: BannerModel) {
        bannerImageView.image = UIImage(systemName: bannerModel.imageName)
        titleLabel.text = bannerModel.title
    }
}

private extension BannerCell {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        let offset: CGFloat = 16.0
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(offset)
        }
    }
}
