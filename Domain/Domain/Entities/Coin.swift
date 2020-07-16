//
//  Coin.swift
//  Domain
//
//  Created by Jordan Capa on 7/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation

public struct Coin: Equatable, Identifiable {
    public var id: String
    public let code: String
    public let country: String
    public let name: String
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
