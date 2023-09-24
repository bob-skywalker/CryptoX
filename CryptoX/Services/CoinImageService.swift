////
////  CoinImageService.swift
////  CryptoX
////
////  Created by Bo Zhong on 9/24/23.
////
//
//import Foundation
//import SwiftUI
//import Combine
//
//
//class CoinImageService{
//    @Published var image: UIImage? = nil
//    private var imageSubscription: AnyCancellable?
//    private var coin: CoinModel
//
//
//    init(coin: CoinModel) {
//        self.coin = coin
//        getCoinImage()
//    }
//
//    private func getCoinImage(){
//        guard let urlString = URL(string: coin.image) else { return }
//        imageSubscription = NetworkManager.download(url: urlString)
//            .tryMap({ (data) -> UIImage? in
//                return UIImage(data: data)
//            })
//            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] receivedImage in
//                self?.image = receivedImage
//                self?.imageSubscription?.cancel()
//            })
//    }
//
//}
