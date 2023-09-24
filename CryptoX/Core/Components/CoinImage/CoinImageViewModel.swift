//
//  CoinImageViewModel.swift
//  CryptoX
//
//  Created by Bo Zhong on 9/24/23.
//

import Foundation
import Combine
import SwiftUI

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.isLoading = true
        self.addSubscriber()
    }
    
    private func addSubscriber(){
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] receivedImage in
                self?.image = receivedImage
            }
            .store(in: &cancellables)
    }
    
}


