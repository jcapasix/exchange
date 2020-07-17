//
//  SplashView.swift
//  Exchange
//
//  Created by Jordan Capa on 7/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import SwiftUI
import Domain

struct SplashView: View {
    
    private var firstCoin = Coin(id: "001", code: "PE", country: "Perú", name: "Soles", usdBuy: 3.35, usdSale: 3.24)
    private var secondCoin = Coin(id: "002", code: "USD", country: "Estados Unidos", name: "Dólares", usdBuy: 1.00, usdSale: 1.00)
    
    @State var showOneLevelIn = false
    @ObservedObject var viewModel: SplashViewModel
    @State var timeRemaining = 2
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Image("icon_bcp")
                .resizable()
                .frame(maxWidth: 300, maxHeight: 110, alignment: .center)
                NavigationLink(destination: HomeView(viewModel: HomeViewModel(), firstCoin: self.firstCoin, secondCoin: self.secondCoin), isActive: self.$showOneLevelIn, label: { EmptyView() })
                ActivityIndicatorOverlay()
            }
        }
        
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onTapGesture {
            self.hideKeyboard()
        }
        .onReceive(timer) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
            if self.timeRemaining == 0{
                self.showOneLevelIn = true
            }
        }
    }
}


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
