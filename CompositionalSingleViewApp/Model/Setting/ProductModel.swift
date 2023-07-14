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
    
    static func getItems(menu:ProductMenuType) -> [ProductModel] {
        switch menu {
        case .updown:
            return [
                ProductModel(imageName: "", name: "업다운 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "업다운 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "업다운 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "업다운 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "업다운 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
            ]
        case .up:
            return [
                ProductModel(imageName: "", name: "업 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "업 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "업 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "업 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "업 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
            ]
        case .dividend:
            return [
                ProductModel(imageName: "", name: "배당 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "배당 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "배당 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "배당 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "배당 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
            ]
        case .dividenddate:
            return [
                ProductModel(imageName: "", name: "배당일 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "배당일 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "배당일 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "배당일 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "배당일 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
            ]
        case .volume:
            return [
                ProductModel(imageName: "", name: "거래량 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "거래량 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "거래량 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "거래량 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "거래량 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
            ]
        case .marketcap:
            return [
                ProductModel(imageName: "", name: "시가총액 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "시가총액 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "시가총액 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "시가총액 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "시가총액 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
            ]
        case .landprice:
            return [
                ProductModel(imageName: "", name: "공시지가 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "공시지가 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "공시지가 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "공시지가 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "", name: "공시지가 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
            ]
        }
    }
}
