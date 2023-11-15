//
//  BitcoinMiningFailure.swift
//  CryptoCompletionHandler
//
//  Created by Jeffrey Sweeney on 11/14/23.
//

import SwiftUI

struct BitcoinMiningFailure: View {
    let viewModel: CryptoViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "flame")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundStyle(Color.orange)
                .padding(.vertical)
            
            Text("We must have overheated while Bitcoin mining!")
                .font(.subheadline)
            
            Button(action: {
                viewModel.mockAFailure = false
                viewModel.fetchCryptoData()
            }, label: {
                Text("Reload Coins")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                    .frame(width: 352, height: 44)
                    .background(.green)
                    .cornerRadius(8)
            })
            .padding(.top, 48)
        }
    }
}

#Preview {
    BitcoinMiningFailure(viewModel: CryptoViewModel())
}
