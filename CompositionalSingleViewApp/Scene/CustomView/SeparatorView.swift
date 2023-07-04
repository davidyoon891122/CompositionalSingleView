//
//  SeparatorView.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/04.
//

import UIKit
import SnapKit

enum SeparatorDirection {
    case vertical
    case horizontal
}

final class SeparatorView: UIView {
    private var height: CGFloat = 0.0
    private var color: UIColor = .lightGray
    private var direction: SeparatorDirection = .horizontal
    
    private lazy var separator: UIView = {
        let view = UIView()
        
        return view
    }()
    
    
    init(
        height: CGFloat = 1,
        color: UIColor = .lightGray,
        direction: SeparatorDirection = .horizontal
    ) {
        self.height = height
        self.color = color
        self.direction = direction
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SeparatorView {
    func setupViews() {
        [
            separator
        ]
            .forEach {
                addSubview($0)
            }
        
        separator.backgroundColor = color
        
        switch direction {
        case .vertical:
            separator.snp.makeConstraints {
                $0.edges.equalToSuperview()
                $0.width.equalTo(height)
            }
        case .horizontal:
            separator.snp.makeConstraints {
                $0.edges.equalToSuperview()
                $0.height.equalTo(height)
            }
        }
    }
}
