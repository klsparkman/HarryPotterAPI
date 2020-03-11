//
//  Character.swift
//  HarryPotterAPI
//
//  Created by Kelsey Sparkman on 3/11/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import Foundation

struct Character: Codable {
    let id: String
    let name: String
    let role: String
    let house: String
    let bloodStatus: String
}
