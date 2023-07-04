//
//  NewsModel.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/04.
//

import Foundation

struct NewsModel: Hashable {
    let id = UUID()
    let title: String
    let content: String
}

extension NewsModel {
    static let items = [
        NewsModel(title: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어", content: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어"),
        NewsModel(title: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어", content: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어"),
        NewsModel(title: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어", content: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어"),
        NewsModel(title: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어", content: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어"),
        NewsModel(title: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어", content: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어"),
        NewsModel(title: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어", content: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어"),
        NewsModel(title: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어", content: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어"),
        NewsModel(title: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어", content: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어"),
        NewsModel(title: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어", content: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어"),
        NewsModel(title: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어", content: "롯데칠성음료 아스파탐, 1일 권장 섭취량 초과하지 않는 범위서 소량 들어있어"),
    ]
}
