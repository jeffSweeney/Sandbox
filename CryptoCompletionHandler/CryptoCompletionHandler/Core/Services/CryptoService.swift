//
//  CryptoService.swift
//  CryptoCompletionHandler
//
//  Created by Jeffrey Sweeney on 11/14/23.
//

import Foundation

class CryptoService {
    private init() {
        
    }
    
    func fetchCoins(completion: @escaping(Result<[Coin], CoinAPIError>) -> Void) {
        let coinGeckoAPI = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=150&page=1&sparkline=false&locale=en"
        guard let apiURL = URL(string: coinGeckoAPI) else { return }
        
        let task = URLSession.shared.dataTask(with: apiURL) { data, response, taskError in
            if let taskError = taskError {
                completion(.failure(.dataTaskError(taskError)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                completion(.success(coins))
            } catch {
                completion(.failure(.dataDecodingFailure(error)))
            }
        }
        
        task.resume()
    }
}

extension CryptoService {
    static let shared = CryptoService()
}
