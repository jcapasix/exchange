//
//  Coin.swift
//  Domain
//
//  Created by Jordan Capa on 7/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation
import Data

public struct Coin: Equatable, Identifiable {
    public var id: String
    public var code: String
    public var country: String
    public var name: String
    public var value: String = ""
    public var usdBuy: Double
    public var usdSale: Double

    public init(id: String, code: String, country: String, name: String, usdBuy: Double, usdSale: Double) {
        self.id = id
        self.code = code
        self.country = country
        self.name = name
        self.usdBuy = usdBuy
        self.usdSale = usdSale
    }
}
extension Coin{
    init(item: CoinEntity) {
        self.init(id: item.id, code: item.code, country: item.country, name: item.name, usdBuy: item.usdBuy, usdSale: item.usdSale)
    }
}

