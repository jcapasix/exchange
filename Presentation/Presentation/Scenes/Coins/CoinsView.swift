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
    
    @ObservedObject var viewModel: CoinsViewModel
    @Binding var showModal: Bool
    @Binding var coin:Coin
    
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                Image("icon_bcp")
                    .resizable()
                    .frame(maxWidth: 180, maxHeight: 65, alignment: .center)
                    .padding(.top, 10)
                Spacer()
                if self.viewModel.isLoading {
                    ActivityIndicatorOverlay()
                } else {
                    List(viewModel.dataSource) { rowViewModel in
                        Button(action: {
                            self.coin = rowViewModel
                            self.showModal = false
                        }) {
                            CountryView(coin: rowViewModel)
                        }
                    }.animation(.interactiveSpring())
                }
                
                
                Spacer()
            }
            .frame(maxHeight: .infinity)
        }.onAppear(perform: self.viewModel.fetchCoins)
    }
}


struct CountryView: View {
    var coin:Coin
    var body: some View {
        HStack(spacing: 0){
            Image(coin.code)
                .resizable()
                .frame(maxWidth: 70, maxHeight: 70)
            VStack(spacing: 4){
                Text(coin.country)
                    .font(.system(size: 14, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("1 USD = \(coin.usdBuy)")
                .font(.system(size: 11))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 30)
        }
        .padding(.horizontal, 30)
    }
}


