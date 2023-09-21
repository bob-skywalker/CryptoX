//
//  HomeViewModel.swift
//  CryptoX
//
//  Created by Bo Zhong on 9/21/23.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var coins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataService: CoinDataService = CoinDataService()
    private var cancellable = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){
        dataService.$allCoins
            .sink(receiveValue: {[weak self] receivedItems in
                self?.coins = receivedItems
            })
            .store(in: &cancellable)
    }

}
