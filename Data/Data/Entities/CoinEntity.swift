//
//  CoinEntity.swift
//  Data
//
//  Created by Jordan Capa on 7/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation

public struct CoinEntity: Decodable{
    public var id: String
    public let code: String
    public let country: String
    public let name: String
    public var usdBuy: Double
    public var usdSale: Double

    enum CodingKeys: String, CodingKey {
        case id
        case code
        case country
        case name
        case usdBuy
        case usdSale
    }
}
