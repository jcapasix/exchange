//
//  ExchangeInteractor.swift
//  Domain
//
//  Created by Jordan Capa on 7/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation
import Combine
import Data

public protocol ExchangeInteractorProtocol {
    func getCoinsList() -> AnyPublisher<[Coin], Error>
    func exchange(change: Coin, to: Coin) -> String
}

public class ExchangeInteractor: ExchangeInteractorProtocol{
    
    public init(){}
    public var repository:ExchangeRepositoryProtocol = ExchangeRepository()
    
    public func getCoinsList() -> AnyPublisher<[Coin], Error> {
        self.repository.coinsLists()
        .map { response in
            response.coins.map(Coin.init)
        }
        .mapError({ (error) -> Error in
            error as Error
        })
        .eraseToAnyPublisher()
    }
    
    public func exchange(change: Coin, to: Coin) -> String {
        let defaultValue = 0.00
        if to.code == "USD"{
            return "\(exchangeUSD(change: change, to: change, defaultValue))"
        }
        else if change.code == "USD"{
            return "\((Double(change.value) ?? defaultValue) * to.usdSale)"
        }
        let usdValue =  exchangeUSD(change: change, to: change, defaultValue)
        return "\(usdValue * to.usdSale)"
    }
    
    private func exchangeUSD(change: Coin, to: Coin, _ defaultValue:Double) -> Double{
        return (Double(change.value) ?? defaultValue) / change.usdSale
    }
    
}

