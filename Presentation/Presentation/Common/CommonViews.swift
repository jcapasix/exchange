//
//  CommonViews.swift
//  Exchange
//
//  Created by Jordan Capa on 7/16/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorOverlay: View {

    @State var spinCircle = false

    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.5, to: 1)
                .stroke(Color.gray, lineWidth: 4)
                .frame(width: 80)
                .rotationEffect(.degrees(spinCircle ? 0 : -360), anchor: .center)
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            }
        
        .onAppear {
            self.spinCircle = true
        }
    }
}
