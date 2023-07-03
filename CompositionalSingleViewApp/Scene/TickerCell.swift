//
//  TickerCell.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/06/30.
//

import UIKit
import SnapKit

final class TickerCell: UICollectionViewCell {
    static let identifier = "TickerCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Samsung"
        label.textColor = .label
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "98,000"
        label.textColor = .red
        
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        [
            titleLabel,
            priceLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        let offset: CGFloat = 16.0
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(offset)
            $0.bottom.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8.0)
        }
        
        priceLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(tickerModel: TickerModel) {
        titleLabel.text = tickerModel.title
        priceLabel.text = String(format: "%f.4",tickerModel.price)
    }
}

private extension TickerCell {
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
