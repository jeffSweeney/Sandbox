//
//  CryptoList.swift
//  CryptoCompletionHandler
//
//  Created by Jeffrey Sweeney on 11/14/23.
//

import SwiftUI

struct CryptoList: View {
    @StateObject var viewModel = CryptoViewModel()
    
    var body: some View {
        NavigationStack {
            if let coins = viewModel.coins, !viewModel.mockAFailure {
                List(coins) { coin in
                    NavigationLink {
                        CryptoPage(coin: coin)
                    } label: {
                        CryptoCell(coin: coin)
                    }
                }
                .refreshable {
                    viewModel.fetchCryptoData()
                }
                .navigationTitle("Crypto Coins")
            } else {
                BitcoinMiningFailure(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    CryptoList()
}
