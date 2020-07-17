//
//  HomeViewModel.swift
//  Exchange
//
//  Created by Jordan Capa on 7/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation
import Combine
import Domain

class HomeViewModel: ObservableObject, Identifiable {

    @Published var isLoading: Bool = true
    @Published var value: Double = 0.0
    
    private var interactor = ExchangeInteractor()

    init(scheduler: DispatchQueue = DispatchQueue(label: "CoinsViewModel")) {}

    public func exchange(change: Coin, to: Coin) -> String {
        self.interactor.exchange(change: change, to: to)
    }
 
}
