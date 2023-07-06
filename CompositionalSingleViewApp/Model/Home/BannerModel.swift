//
//  BannerModel.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/03.
//

import Foundation

struct BannerModel: Hashable {
    let id = UUID()
    let title: String
    let imageName: String
}


extension BannerModel {
    static let items = [
        BannerModel(title: "First Banner is an arrorshape", imageName: "arrowshape.turn.up.forward"),
        BannerModel(title: "Second Banner is an rectangleportraitandarrow", imageName: "rectangle.portrait.and.arrow.right.fill"),
        BannerModel(title: "Third Banner is an scribble", imageName: "scribble"),
    ]
}
