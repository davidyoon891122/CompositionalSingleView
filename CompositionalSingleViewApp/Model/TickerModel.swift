//
//  TickerModel.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/03.
//

import Foundation

struct TickerModel: Hashable {
    let id = UUID()
    let title: String
    let price: Double
}

extension TickerModel {
    static let items = [
        TickerModel(title: "SAMSUNG", price: 71000),
        TickerModel(title: "APPLE", price: 197),
        TickerModel(title: "TESLA", price: 261.7700),
        TickerModel(title: "META", price: 286.9800),
        TickerModel(title: "NVIDIA", price: 423.0200),
        TickerModel(title: "AMAZON", price: 130.3600),
        TickerModel(title: "AMD", price: 113.9100),
        TickerModel(title: "VISA", price: 237.4800),
        TickerModel(title: "GOOGLE", price: 119.7000),
    ]
}
