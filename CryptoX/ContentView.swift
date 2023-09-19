//
//  ContentView.swift
//  CryptoX
//
//  Created by Bo Zhong on 9/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                Text("Accent Color")
                    .foregroundColor(Color.myAccentColor)
                
                Text("Secondary Text Color")
                    .foregroundColor(Color.secondaryTextColor)
                
                Text("Red Color")
                    .foregroundColor(Color.redColor)
                
                Text("Green Color")
                    .foregroundColor(Color.greenColor)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
