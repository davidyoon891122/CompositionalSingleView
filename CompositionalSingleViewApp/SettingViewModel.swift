//
//  SettingViewModel.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/13.
//

import Foundation

enum ProductMenuType: String {
    case updown
    case up
    case dividend
    case dividenddate
    case volume
    case marketcap
    case landprice
    
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
    
}

protocol SettingViewModelType {
    var inputs: SettingViewModelInput { get }
    var outputs: SettingViewModelOutput { get }
}

class SettingViewModel: SettingViewModelType, SettingViewModelInput, SettingViewModelOutput {
    var inputs: SettingViewModelInput { self }
    var outputs: SettingViewModelOutput { self }
    
    func requestProductDataByMenu(menu: ProductMenuType) {
        
    }
    
}
