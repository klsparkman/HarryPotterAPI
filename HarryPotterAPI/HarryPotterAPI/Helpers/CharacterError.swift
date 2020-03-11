//
//  CharacterError.swift
//  HarryPotterAPI
//
//  Created by Kelsey Sparkman on 3/11/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import Foundation

enum CharacterError: LocalizedError {
    case invalidURL
    case noData
    case unableToDecode
    case thrown(Error)
    
    var errorDescription: String? {
        switch self {
            
        case .invalidURL:
            return "Unable to reach server."
        case .noData:
            return "Server responded to no data"
        case .unableToDecode:
            return "Server responded to bad data"
        case .thrown(let error):
            return error.localizedDescription
        }
        
    }
}
