//
//  MenuModel.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/07.
//

import Foundation

struct MenuModel: Hashable {
    let id = UUID()
    let menuName: String
}

extension MenuModel {
    static let items = [
        MenuModel(menuName: "등락"),
        MenuModel(menuName: "상승"),
        MenuModel(menuName: "배당률"),
        MenuModel(menuName: "배당일"),
        MenuModel(menuName: "거래량"),
        MenuModel(menuName: "시가총액"),
        MenuModel(menuName: "공시지가")
    ]
}
