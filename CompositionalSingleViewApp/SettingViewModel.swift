//
//  SettingViewModel.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/13.
//

import Foundation
import Combine

enum ProductMenuType: String {
    case updown = "등락"
    case up = "상승"
    case dividend = "배당률"
    case dividenddate = "배당일"
    case volume = "거래량"
    case marketcap = "시가총액"
    case landprice = "공시지가"
    
    var title: String {
        switch self {
        case .updown:
            return "등락"
        case .up:
            return "상승"
        case .dividend:
            return "배당률"
        case .dividenddate:
            return "배당일"
        case .volume:
            return "거래량"
        case .marketcap:
            return "시가총액"
        case .landprice:
            return "공시지가"
        }
    }
}


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
