//
//  CoinResponse.swift
//  Data
//
//  Created by Jordan Capa on 7/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

public struct CoinResponse: Decodable {
    public let coins: [CoinEntity]
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        var coins = [CoinEntity]()

        while !container.isAtEnd {
            let coin = try container.decode(CoinEntity.self)
            coins.append(coin)
        }
        self.coins = coins
    }
}
