//
//  HomeView.swift
//  Exchange
//
//  Created by Jordan Capa on 7/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import SwiftUI
import Domain
import Combine

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @State var firstCoin: Coin
    @State var secondCoin: Coin
    @State var coins: [MoneyView] = []
    @State var change: Bool = true
    private let defaultValue = "0.00"

    var body: some View {
        ZStack {
            VStack{
                Image("icon_bcp")
                    .resizable()
                    .frame(maxWidth: 180, maxHeight: 65, alignment: .center)
                Spacer()
                ZStack(alignment: .center){
                    VStack(spacing: 2){
                        ForEach(coins, id: \.id) { coin in
                            coin.onReceive(Just(self.$coins)) { (_) in
                                self.action()
                            }
                        }
                    }
                    .animation(.linear(duration: 0.25))
                    .frame(maxWidth: .infinity, maxHeight: 130, alignment: .center)
                    .padding(.horizontal, 20)
                    HStack{
                        Spacer()
                        Button(action: {
                            let coinTemp = self.coins[1]
                            self.coins[1] = self.coins[0]
                            self.coins[0] = coinTemp
                            self.change.toggle()
                            self.secondCoin.value = ""
                            self.firstCoin.value = ""
                        }) {
                            Image("icon_exchange")
                                .resizable()
                                .frame(maxWidth: 30, maxHeight: 30)
                                .background(Color.red)
                                .foregroundColor(Color.black)
                                .cornerRadius(15)
                        }
                        .padding(.trailing, 50.0)
                    }
                }
                Text("Compra: \(change ? self.firstCoin.usdBuy : self.secondCoin.usdBuy)  |  Venta: \(change ? self.firstCoin.usdSale :self.secondCoin.usdSale)")
                    .frame(maxWidth: .infinity, maxHeight: 70, alignment: .center)
                
                Spacer()
                Button(action: {
                }) {
                    Text("Empieza tu operación")
                }
                .frame(maxWidth: .infinity, maxHeight: 55, alignment: .center)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .padding(.bottom, 0.0)
            }
            .frame(maxHeight: .infinity)
        }

        .onAppear() {
            self.coins = [MoneyView(id: self.firstCoin.id, coin: self.$firstCoin), MoneyView(id: self.secondCoin.id, coin: self.$secondCoin)]
            self.action()
        }
        .navigationBarBackButtonHidden(true)
    }

    
    func action(){
        if self.change{
            if !self.secondCoin.value.isEmpty{
                self.secondCoin.value = viewModel.exchange(change: self.firstCoin, to: self.secondCoin)
                return
            }
            self.secondCoin.value = defaultValue
            return
        }
        else{
            if !self.firstCoin.value.isEmpty{
                self.firstCoin.value = viewModel.exchange(change: self.secondCoin, to: self.firstCoin)
                return
            }
            self.firstCoin.value = defaultValue
            return
        }
    }
}


struct MoneyView: View, Identifiable {
    var id: String
    @Binding var coin:Coin
    @State private var showModal = false
    
    var body: some View {
        HStack(spacing: 0){
            VStack(spacing: 4){
                Text("Tu mandas \(coin.name)")
                    .font(.system(size: 11))
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("0.00", text: self.$coin.value)
                    .keyboardType(.decimalPad)
            }
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color.white)
            Text(coin.name)
                .frame(maxWidth: 100, maxHeight: .infinity, alignment: .center)
                .foregroundColor(Color.white)
                .background(Color.black)
                .animation(.linear(duration: 0.3))
                .onLongPressGesture(minimumDuration: 1) {
                    self.showModal.toggle()
                }
                .sheet(isPresented: $showModal) {
                    CoinsView(viewModel: CoinsViewModel(), showModal: self.$showModal, coin: self.$coin)
                }
        }
        .border(Color.gray, width: 2)
        .cornerRadius(6)
        
    }
}
