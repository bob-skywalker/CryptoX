//
//  CryptoXApp.swift
//  CryptoX
//
//  Created by Bo Zhong on 9/19/23.
//

import SwiftUI

@main
struct CryptoXApp: App {
    @StateObject private var homeViewModel: HomeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(homeViewModel)
        }
    }
}
