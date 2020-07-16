//
//  CoinsView.swift
//  Exchange
//
//  Created by Jordan Capa on 7/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import SwiftUI
import Domain

struct CoinsView: View {
    @Binding var showModal: Bool
    @Binding var coin:Coin
    
    fileprivate func extractedFunc() -> Text {
        return Text("Hola")
    }
    
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                Image("icon_bcp")
                    .resizable()
                    .frame(maxWidth: 180, maxHeight: 65, alignment: .center)
                    .padding(.top, 20)
                List{
                    Button(action: {
                        self.coin = Coin(id: "003", code: "JAP", country: "Japon", name: "Yenes", usdBuy: 1.35, usdSale: 2.24)
                        self.showModal = false
                    }) {
                        CountryView(coin: Coin(id: "003", code: "JAP", country: "Japon", name: "Yenes", usdBuy: 2.35, usdSale: 2.24))
                    }
                    
                }
            }
            .frame(maxHeight: .infinity)
        }
    }
    
}

struct CountryView: View {
    var coin:Coin
    var body: some View {
        HStack(spacing: 0){
            Image("icon_japan")
            VStack(spacing: 4){
                Text(coin.name)
                    .font(.system(size: 11))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(coin.name)
                .font(.system(size: 11))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}


