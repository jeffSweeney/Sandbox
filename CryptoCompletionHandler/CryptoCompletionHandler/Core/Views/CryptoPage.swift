//
//  CryptoPage.swift
//  CryptoCompletionHandler
//
//  Created by Jeffrey Sweeney on 11/14/23.
//

import SwiftUI

struct CryptoPage: View {
    let coin: Coin
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: coin.image)!) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 144, height: 144)
                        .clipShape(Circle())
                default:
                    Image(systemName: "dollarsign.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 144, height: 144)
                        .clipShape(Circle())
                }
            }
            
            Text(coin.name)
                .font(.title)
                .fontWeight(.semibold)
            
            Text(coin.symbol)
                .font(.callout)
            
            Text(coin.usdFormat)
                .font(.headline)
                .padding(.vertical)
            
            Text("24h change: \(coin.localizedPercentChange)")
                .font(.footnote)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    CryptoPage(coin: Coin(id: "bitcoin",
                          name: "Bitcoin",
                          symbol: "btc",
                          image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                          currentPrice: 35402,
                          priceChange24H: 1.2))
}
