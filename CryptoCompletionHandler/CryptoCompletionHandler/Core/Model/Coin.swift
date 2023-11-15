//
//  Coin.swift
//  CryptoCompletionHandler
//
//  Created by Jeffrey Sweeney on 11/14/23.
//

import SwiftUI

struct Coin: Codable, Identifiable {
    let id: String
    let name: String
    let symbol: String
    let image: String
    let currentPrice: Double
    let priceChange24H: Double
    
    enum CodingKeys: String, CodingKey {
        case id, name, symbol, image
        case currentPrice = "current_price"
        case priceChange24H = "price_change_percentage_24h"
    }
}

extension Coin {
    var usdFormat: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyCode = "USD"
        
        return numberFormatter.string(from: NSNumber(value: self.currentPrice)) ?? "Unavailable"
    }
    
    var localizedPercentChange: String {
        guard self.priceChange24H != 0 else { return "No change" }
        
        let direction = priceChange24H > 0 ? "Up" : "Down"
        return "\(direction) \(abs(self.priceChange24H))%"
    }
}
