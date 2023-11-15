//
//  CoinAPIError.swift
//  CryptoCompletionHandler
//
//  Created by Jeffrey Sweeney on 11/14/23.
//

import Foundation

enum CoinAPIError: Error {
    case dataDecodingFailure(Error)
    case dataTaskError(Error)
    case noData
}
