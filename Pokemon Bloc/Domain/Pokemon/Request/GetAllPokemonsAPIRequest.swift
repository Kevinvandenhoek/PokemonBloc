//
//  GetAllPokemonsAPIRequest.swift
//  GetAllPokemonsAPIRequest
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation

struct GetAllPokemonsAPIRequest: APIRequest {
    
    var backend: Backend { .pokeApi }
    var path: String { "pokemon" }
    var parameters: [String: Encodable] { ["limit": 151] }
}

extension GetAllPokemonsAPIRequest {
    
    struct Response: Codable {
        let count: Int?
        let results: [Pokemon]?
        
        struct Pokemon: Codable {
            let name: String?
            let url: URL?
        }
    }
}
