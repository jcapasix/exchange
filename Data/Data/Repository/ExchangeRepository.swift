//
//  ExchangeRepository.swift
//  Data
//
//  Created by Jordan Capa on 7/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation
import Combine

public protocol ExchangeRepositoryProtocol{
    func coinsLists() -> AnyPublisher<CoinResponse, ExchangeError>
}

public class ExchangeRepository: ExchangeRepositoryProtocol {
    public init(){}
    
    public func coinsLists() -> AnyPublisher<CoinResponse, ExchangeError> {
        return ServiceManager.shared.load(with:"/v3/b4ac4204-dfe5-48d1-8454-d5d56aa6c0d0")
    }
}
