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
    
    @State var showOneLevelIn = true
    
    var body: some View {
        NavigationView{
            VStack{
                Image("icon_bcp")
                .resizable()
                .frame(maxWidth: 300, maxHeight: 110, alignment: .center)
                NavigationLink(destination: HomeView(firstCoin: firstCoin, secondCoin: secondCoin)) {
                    Text("Show Detail View")
                }
//                NavigationLink(destination: HomeView(firstCoin: firstCoin, secondCoin: secondCoin), isActive: $showOneLevelIn, label: { EmptyView() }).navigationBarHidden(true)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
