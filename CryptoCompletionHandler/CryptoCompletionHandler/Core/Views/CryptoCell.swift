//
//  CryptoCell.swift
//  CryptoCompletionHandler
//
//  Created by Jeffrey Sweeney on 11/14/23.
//

import SwiftUI

struct CryptoCell: View {
    let coin: Coin
    
    var body: some View {
        HStack(spacing: 12) {
            CryptoImage(coin: coin)
            
            VStack(alignment: .leading) {
                Text(coin.name)
                    .font(.headline)
                Text(coin.symbol)
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

#Preview {
    CryptoCell(
        coin: Coin(id: "bitcoin",
                   name: "Bitcoin",
                   symbol: "btc",
                   image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                   currentPrice: 35402,
                   priceChange24H: 1.2)
    )
}
