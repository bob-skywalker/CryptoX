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
            leftColumn
            
            Spacer()
            
            if showHoldingsColumn {
                middleColumn
            }
            
            Spacer()
            
            rightColumn
        }
        .font(.subheadline)
        .padding(.horizontal, 5)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
            
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

extension CoinRowView {
    private var leftColumn: some View {
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
        }
    }
    
    private var middleColumn: some View{
        HStack {
            VStack(alignment: .trailing) {
                Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                    .bold()
                Text((coin.currentHoldings ?? 0).asNumberString())
            }
            .foregroundColor(Color.myAccentColor)
            
        }
    }
    
    private var rightColumn: some View {
        HStack {
            VStack(alignment: .trailing){
                Text("\(coin.currentPrice.asCurrencyWith6Decimals())")
                    .bold()
                    .foregroundColor(Color.myAccentColor)
                Text("\(coin.priceChangePercentage24H?.asPercentString() ?? "0%")")
                    .foregroundColor(((coin.priceChangePercentage24H ?? 0) >= 0) ? Color.greenColor : Color.redColor)
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
    }
}
