//
//  ProductModel.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/06.
//

import Foundation

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
        ProductModel(imageName: "wework", name: "등락 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
        ProductModel(imageName: "kyobo", name: "등락 여의도 교보증권 건물", price: 3250, priceValue: 930, priceValuePercent: -10.5),
        ProductModel(imageName: "mirae", name: "등락 종각 미래에셋 건물", price: 4900, priceValue: 550, priceValuePercent: 19.75),
        ProductModel(imageName: "lotte", name: "등락 명동 롯데 호첼", price: 2550, priceValue: -1500, priceValuePercent: -42.50),
        ProductModel(imageName: "trade", name: "등락 삼성 무역센터", price: 5550, priceValue: 2050, priceValuePercent: 32.25),
        ProductModel(imageName: "ifc", name: "등락 여의도 ifc", price: 4250, priceValue: 750, priceValuePercent: 15.75),
    ]
    
    static func getItems(menu:ProductMenuType) -> [ProductModel] {
        switch menu {
        case .updown:
            return [
                ProductModel(imageName: "wework", name: "등락 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "kyobo", name: "등락 여의도 교보증권 건물", price: 3250, priceValue: 930, priceValuePercent: -10.5),
                ProductModel(imageName: "mirae", name: "등락 종각 미래에셋 건물", price: 4900, priceValue: 550, priceValuePercent: 19.75),
                ProductModel(imageName: "lotte", name: "등락 명동 롯데 호첼", price: 2550, priceValue: -1500, priceValuePercent: -42.50),
                ProductModel(imageName: "trade", name: "등락 삼성 무역센터", price: 5550, priceValue: 2050, priceValuePercent: 32.25),
                ProductModel(imageName: "ifc", name: "등락 여의도 ifc", price: 4250, priceValue: 750, priceValuePercent: 15.75),
            ]
        case .up:
            return [
                ProductModel(imageName: "wework", name: "상승 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "kyobo", name: "상승 여의도 교보증권 건물", price: 3250, priceValue: 930, priceValuePercent: -10.5),
                ProductModel(imageName: "mirae", name: "상승 종각 미래에셋 건물", price: 4900, priceValue: 550, priceValuePercent: 19.75),
                ProductModel(imageName: "lotte", name: "상승 명동 롯데 호첼", price: 2550, priceValue: -1500, priceValuePercent: -42.50),
                ProductModel(imageName: "trade", name: "상승 삼성 무역센터", price: 5550, priceValue: 2050, priceValuePercent: 32.25),
                ProductModel(imageName: "ifc", name: "상승 여의도 ifc", price: 4250, priceValue: 750, priceValuePercent: 15.75),
            ]
        case .dividend:
            return [
                ProductModel(imageName: "wework", name: "배당 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "kyobo", name: "배당 여의도 교보증권 건물", price: 3250, priceValue: 930, priceValuePercent: -10.5),
                ProductModel(imageName: "mirae", name: "배당 종각 미래에셋 건물", price: 4900, priceValue: 550, priceValuePercent: 19.75),
                ProductModel(imageName: "lotte", name: "배당 명동 롯데 호첼", price: 2550, priceValue: -1500, priceValuePercent: -42.50),
                ProductModel(imageName: "trade", name: "배당 삼성 무역센터", price: 5550, priceValue: 2050, priceValuePercent: 32.25),
                ProductModel(imageName: "ifc", name: "배당 여의도 ifc", price: 4250, priceValue: 750, priceValuePercent: 15.75),
            ]
        case .dividenddate:
            return [
                ProductModel(imageName: "wework", name: "배당일 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "kyobo", name: "배당일 여의도 교보증권 건물", price: 3250, priceValue: 930, priceValuePercent: -10.5),
                ProductModel(imageName: "mirae", name: "배당일 종각 미래에셋 건물", price: 4900, priceValue: 550, priceValuePercent: 19.75),
                ProductModel(imageName: "lotte", name: "배당일 명동 롯데 호첼", price: 2550, priceValue: -1500, priceValuePercent: -42.50),
                ProductModel(imageName: "trade", name: "배당일 삼성 무역센터", price: 5550, priceValue: 2050, priceValuePercent: 32.25),
                ProductModel(imageName: "ifc", name: "배당일 여의도 ifc", price: 4250, priceValue: 750, priceValuePercent: 15.75),
            ]
        case .volume:
            return [
                ProductModel(imageName: "wework", name: "거래량 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "kyobo", name: "거래량 여의도 교보증권 건물", price: 3250, priceValue: 930, priceValuePercent: -10.5),
                ProductModel(imageName: "mirae", name: "거래량 종각 미래에셋 건물", price: 4900, priceValue: 550, priceValuePercent: 19.75),
                ProductModel(imageName: "lotte", name: "거래량 명동 롯데 호첼", price: 2550, priceValue: -1500, priceValuePercent: -42.50),
                ProductModel(imageName: "trade", name: "거래량 삼성 무역센터", price: 5550, priceValue: 2050, priceValuePercent: 32.25),
                ProductModel(imageName: "ifc", name: "거래량 여의도 ifc", price: 4250, priceValue: 750, priceValuePercent: 15.75),
            ]
        case .marketcap:
            return [
                ProductModel(imageName: "wework", name: "시가총액 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "kyobo", name: "시가총액 여의도 교보증권 건물", price: 3250, priceValue: 930, priceValuePercent: -10.5),
                ProductModel(imageName: "mirae", name: "시가총액 종각 미래에셋 건물", price: 4900, priceValue: 550, priceValuePercent: 19.75),
                ProductModel(imageName: "lotte", name: "시가총액 명동 롯데 호첼", price: 2550, priceValue: -1500, priceValuePercent: -42.50),
                ProductModel(imageName: "trade", name: "시가총액 삼성 무역센터", price: 5550, priceValue: 2050, priceValuePercent: 32.25),
                ProductModel(imageName: "ifc", name: "시가총액 여의도 ifc", price: 4250, priceValue: 750, priceValuePercent: 15.75),
            ]
        case .landprice:
            return [
                ProductModel(imageName: "wework", name: "공시지가 역삼 위워크", price: 4850, priceValue: 250, priceValuePercent: 5.75),
                ProductModel(imageName: "kyobo", name: "공시지가 여의도 교보증권 건물", price: 3250, priceValue: 930, priceValuePercent: -10.5),
                ProductModel(imageName: "mirae", name: "공시지가 종각 미래에셋 건물", price: 4900, priceValue: 550, priceValuePercent: 19.75),
                ProductModel(imageName: "lotte", name: "공시지가 명동 롯데 호첼", price: 2550, priceValue: -1500, priceValuePercent: -42.50),
                ProductModel(imageName: "trade", name: "공시지가 삼성 무역센터", price: 5550, priceValue: 2050, priceValuePercent: 32.25),
                ProductModel(imageName: "ifc", name: "공시지가 여의도 ifc", price: 4250, priceValue: 750, priceValuePercent: 15.75),
            ]
        }
    }
}
