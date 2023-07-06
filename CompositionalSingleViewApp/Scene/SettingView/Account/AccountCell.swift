//
//  AccountCell.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/06.
//

import UIKit
import SnapKit

final class AccountCell: UICollectionViewCell {
    static let identifier = "AccountCell"
    
    private lazy var accountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "text.book.closed.fill")
        
        imageView.tintColor = .gray
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "투자 계좌 연결하기"
        label.textColor = .label
        label.font = .systemFont(ofSize: 22.0, weight: .bold)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "하나은행 계좌를 연결해주세요"
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var connectButton: UIButton = {
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.title = "계좌 연결하기"
        buttonConfig.buttonSize = .small
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        buttonConfig.background.backgroundColor = .blue
        buttonConfig.baseForegroundColor = .white
        buttonConfig.cornerStyle = .small
    
        let button = UIButton(configuration: buttonConfig)
        
        return button
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 8.0
        view.layer.masksToBounds = true
        
        [
            accountImageView,
            titleLabel,
            descriptionLabel,
            connectButton
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        accountImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(80.0)
            $0.height.equalTo(100.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(accountImageView.snp.bottom).offset(offset)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(offset)
            $0.centerX.equalToSuperview()
        }
        
        connectButton.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(offset)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-32)
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
}

private extension AccountCell {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        let inset: CGFloat = 16.0
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(inset)
        }
    }
}
