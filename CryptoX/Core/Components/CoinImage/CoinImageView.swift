////
////  CoinImageView.swift
////  CryptoX
////
////  Created by Bo Zhong on 9/24/23.
////
//
//import SwiftUI
//import Combine
//import Kingfisher
//
//
//
//struct CoinImageView: View {
//    @StateObject var coinImageViewModel: CoinImageViewModel
//
//    init(coin: CoinModel){
//        _coinImageViewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
//    }
//
//    var body: some View {
//        ZStack{
//            if let image = coinImageViewModel.image {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//            } else if coinImageViewModel.isLoading {
//                ProgressView()
//            } else {
//                Image(systemName: "questionmark")
//                    .foregroundColor(Color.secondaryTextColor)
//            }
//        }
//    }
//}
//
//struct CoinImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinImageView(coin: dev.coin)
//            .previewLayout(.sizeThatFits)
//    }
//}
