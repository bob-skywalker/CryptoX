//
//  CoinRowView.swift
//  CryptoX
//
//  Created by bo zhong on 9/19/23.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.secondaryTextColor)
                .frame(minWidth: 30)
            
            Circle()
                .frame(width: 30, height: 30)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 5)
                .foregroundColor(Color.myAccentColor)
            
            Spacer()
            if showHoldingsColumn {
                VStack {
                }
            }
            
            VStack(alignment: .trailing){
                Text("\(coin.currentPrice.asCurrencyWith6Decimals())")
                    .bold()
                    .foregroundColor(Color.myAccentColor)
                Text("\(coin.priceChangePercentage24H?.asPercentString() ?? "0%")")
                    .foregroundColor(((coin.priceChangePercentage24H ?? 0) >= 0) ? Color.greenColor : Color.redColor)
            }
        }
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
    }
}
