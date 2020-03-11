//
//  CharacterController.swift
//  HarryPotterAPI
//
//  Created by Kelsey Sparkman on 3/11/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import Foundation
import UIKit

class CharacterController {
    //URL Constants
    static let baseURL = URL(string: "https://www.potterapi.com/v1/")
    static let characterEndpoint = "character"
    
    //Fetch Request
    static func fetchCharacter(searchTerm: String, completion: @escaping (Result<Character, CharacterError>) -> Void) {
        
        //1) URL
        guard let baseURL = baseURL else {return completion(.failure(.invalidURL))}
        let characterURL = baseURL.appendingPathComponent(characterEndpoint)
        let searchTermURL = characterURL.appendingPathComponent(searchTerm.lowercased())
        print(searchTermURL)
        //2) Data Task
        URLSession.shared.dataTask(with: searchTermURL) { (data, _, error) in
            
            //3) Error Handling
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
            //4) Check for Data
            guard let data = data else {return completion(.failure(.noData))}
            //5) Decode Data
            do {
                let decoder = JSONDecoder()
                let character = try decoder.decode(Character.self, from: data)
                return completion(.success(character))
            } catch {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
        }.resume()
    }
    
    
    
    
    
}//End of Class
