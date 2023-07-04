//
//  NewsCell.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/04.
//

import UIKit
import SnapKit

final class NewsCell: UICollectionViewCell {
    static let identifier = "NewsCell"
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어"
        label.textColor = .label
        
        return label
    }()
    
    private let separatorView = SeparatorView()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        
        [
            titleLabel,separatorView
            
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let inset: CGFloat = 16.0
        
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(inset)
        }
        
        separatorView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(inset)
            $0.trailing.equalToSuperview().offset(-inset)
            $0.bottom.equalToSuperview()
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
    
    func setupCell(newsModel: NewsModel) {
        titleLabel.text = newsModel.title
    }
}

private extension NewsCell {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                contentView.addSubview($0)
            }
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
