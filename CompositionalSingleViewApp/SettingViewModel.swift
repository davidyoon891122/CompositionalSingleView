//
//  SettingViewModel.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/13.
//

import Foundation
import Combine

protocol SettingViewModelInput {
    func requestProductDataByMenu(menu: ProductMenuType)
}

protocol SettingViewModelOutput {
    var productModelSubject: PassthroughSubject<[ProductModel], Never> { get }
}

protocol SettingViewModelType {
    var inputs: SettingViewModelInput { get }
    var outputs: SettingViewModelOutput { get }
}

class SettingViewModel: SettingViewModelType, SettingViewModelInput, SettingViewModelOutput {
    var inputs: SettingViewModelInput { self }
    var outputs: SettingViewModelOutput { self }
    
    var productModelSubject: PassthroughSubject<[ProductModel], Never> = .init()
    
    func requestProductDataByMenu(menu: ProductMenuType) {
        productModelSubject.send(ProductModel.getItems(menu: menu))
    }
    
}
