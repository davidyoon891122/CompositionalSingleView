//
//  NewsHeaderView.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/04.
//

import UIKit
import SnapKit

final class NewsHeaderView: UICollectionReusableView {
    static let identifier = "NewsHeaderView"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "News"
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

private extension NewsHeaderView {
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
