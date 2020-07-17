//
//  CoinsViewModel.swift
//  Exchange
//
//  Created by Jordan Capa on 7/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation
import Combine
import Domain

class CoinsViewModel: ObservableObject, Identifiable {

    @Published var dataSource: [Coin] = []
    @Published var isLoading: Bool = true

    
    private var disposables = Set<AnyCancellable>()
    private var interactor = ExchangeInteractor()

    init(scheduler: DispatchQueue = DispatchQueue(label: "CoinsViewModel")) {}

    func fetchCoins() {
        isLoading = true
        self.interactor.getCoinsList()
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                self.isLoading = false
                switch value {
                case .failure:
                    self.dataSource = []
                    print(value)
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] coins in
                guard let self = self else { return }
                self.isLoading = false
                self.dataSource = coins
        })
        .store(in: &disposables)
       
    }

}
