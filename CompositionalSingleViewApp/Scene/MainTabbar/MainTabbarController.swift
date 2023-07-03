//
//  MainTabbarController.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/03.
//

import UIKit
import SnapKit

final class MainTabbarController: UITabBarController {
    private let viewControllerItems: [UIViewController] = TabbarItem.allCases.map {
        let viewController = $0.viewController
        viewController.tabBarItem = UITabBarItem(title: $0.title, image: $0.iconImage.default, selectedImage: $0.iconImage.selected)

        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = viewControllerItems
    }
}
