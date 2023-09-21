//
//  CoinDataService.swift
//  CryptoX
//
//  Created by Bo Zhong on 9/21/23.
//

import SwiftUI
import Combine


class CoinDataService: ObservableObject {
    var coinSubscription: AnyCancellable?
    
    @Published var allCoins: [CoinModel] = []
    
    init(){
        fetchCoinsData()
    }
    
    private func fetchCoinsData(){
        guard let urlString = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en") else { return }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        coinSubscription = URLSession.shared.dataTaskPublisher(for: urlString)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (data, response) in
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: decoder)
            .sink(receiveCompletion: { completion in
                switch completion{
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
            }, receiveValue: {[weak self] receivedItems in
                self?.allCoins = receivedItems
                self?.coinSubscription?.cancel()
            })
    }
}
