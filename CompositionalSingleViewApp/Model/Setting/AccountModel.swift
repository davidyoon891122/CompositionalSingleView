//
//  AccountModel.swift
//  CompositionalSingleViewApp
//
//  Created by jiwon Yoon on 2023/07/06.
//

import Foundation

struct AccountModel: Hashable {
    let id = UUID()
    let userName: String
    let accountNumber: String
    let accountDescription: String
}

struct EmptyAccountModel: Hashable {
    let id = UUID()
    let title: String
    let description: String
}

extension AccountModel {
    static let items = [
        AccountModel(userName: "도레미", accountNumber: "61123242-01", accountDescription: "나의 주식 계좌")
    ]
}

extension EmptyAccountModel {
    static let item = [
        EmptyAccountModel(title: "투자 계좌 연결하기", description: "하나은행 계좌를 연결해주세요")
    ]
}
