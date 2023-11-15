//
//  CryptoImage.swift
//  CryptoCompletionHandler
//
//  Created by Jeffrey Sweeney on 11/14/23.
//

import SwiftUI

struct CryptoImage: View {
    let coin: Coin
    
    var body: some View {
        AsyncImage(url: URL(string: coin.image)!) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            default:
                Image(systemName: "dollarsign.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    CryptoImage(
        coin: Coin(id: "bitcoin",
                   name: "Bitcoin",
                   symbol: "btc",
                   image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                   currentPrice: 35402,
                   priceChange24H: 1.2))
}
