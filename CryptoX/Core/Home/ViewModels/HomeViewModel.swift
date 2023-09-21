//
//  HomeViewModel.swift
//  CryptoX
//
//  Created by Bo Zhong on 9/21/23.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var coins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.coins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
    
    
}
