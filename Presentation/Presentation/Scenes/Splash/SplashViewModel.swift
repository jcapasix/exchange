//
//  SplashViewModel.swift
//  Exchange
//
//  Created by Jordan Capa on 7/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import Foundation
import Combine
import Domain

class SplashViewModel: ObservableObject, Identifiable {

    @Published var isLoading: Bool = true
    private var interactor = ExchangeInteractor()
    
    init(){}
}

