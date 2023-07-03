//
//  TabbarItem.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/03.
//

import UIKit

enum TabbarItem: CaseIterable {
    case main
    case trade
    case chat
    case settings
    
    
    var title: String {
        switch self {
        case .main:
            return "Main"
        case .trade:
            return "Trade"
        case .chat:
            return "Chat"
        case .settings:
            return "Settings"
        }
    }
    
    var iconImage: (default: UIImage?, selected: UIImage?) {
        switch self {
        case .main:
            return (
                UIImage(systemName: "house"),
                UIImage(systemName: "house.fill")
            )
        case .trade:
            return (
                UIImage(systemName: "chart.bar"),
                UIImage(systemName: "chart.bar.fill")
            )
        case .chat:
            return (
                UIImage(systemName: "ellipsis.message"),
                UIImage(systemName: "ellipsis.message.fill")
            )
        case .settings:
            return (
                UIImage(systemName: "gearshape"),
                UIImage(systemName: "gearshape.fill")
            )
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .main:
            return UINavigationController(rootViewController: HomeViewController())
        case .trade:
            return UINavigationController(rootViewController: HomeViewController())
        case .chat:
            return UINavigationController(rootViewController: HomeViewController())
        case .settings:
            return UINavigationController(rootViewController: HomeViewController())
        }
    }
}
