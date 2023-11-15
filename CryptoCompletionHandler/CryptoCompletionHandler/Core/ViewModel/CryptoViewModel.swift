//
//  CryptoViewModel.swift
//  CryptoCompletionHandler
//
//  Created by Jeffrey Sweeney on 11/14/23.
//

import Foundation

class CryptoViewModel: ObservableObject {
    @Published var coins: [Coin]? = []
    
    var mockAFailure = true
    
    init() {
        fetchCryptoData()
    }
    
    func fetchCryptoData() {
        CryptoService.shared.fetchCoins { result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let coins): self.coins = coins
                    case .failure: self.coins = nil
                }
            }
        }
    }
}
