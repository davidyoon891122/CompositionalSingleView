//
//  ProductModel.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/06.
//

import Foundation

struct ProductModel: Hashable {
    let id = UUID()
    let imageName: String
    let name: String
    let price: Int
    let priceValue: Int
    let priceValuePercent: Double
}

extension ProductModel {
    static let items = [
        ProductModel(imageName: "", name: "역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
        ProductModel(imageName: "", name: "역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
        ProductModel(imageName: "", name: "역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
        ProductModel(imageName: "", name: "역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
        ProductModel(imageName: "", name: "역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
        ProductModel(imageName: "", name: "역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
    ]
}
