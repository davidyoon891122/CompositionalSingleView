//
//  BannerHeaderView.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/03.
//

import UIKit
import SnapKit

final class BannerHeaderView: UICollectionReusableView {
    static let identifier = "BannerHeaderView"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Banner"
        label.font = .systemFont(ofSize: 22.0, weight: .bold)
        
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        [
            titleLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let inset: CGFloat = 8.0
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(inset)
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

private extension BannerHeaderView {
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
}
