//
//  ProductMenuCell.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/07.
//

import UIKit
import SnapKit

final class ProductMenuCell: UICollectionViewCell {
    static let identifier = "ProductMenuCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "등락"
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 4.0
        
        [
            titleLabel
        ]
            .forEach {
                view.addSubview($0)
            }
        
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8.0)
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
    
    func setupCell(title: String) {
        titleLabel.text = title
    }
}

private extension ProductMenuCell {
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
