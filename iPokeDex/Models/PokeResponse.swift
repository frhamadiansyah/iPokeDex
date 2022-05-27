//
//  PokeModel.swift
//  iPokeDex
//
//  Created by Fandrian Rhamadiansyah on 25/05/22.
//

import Foundation

let spriteBaseUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"

struct PokeResponse: Decodable {
    let results : [Pokemon]
    
    // abilities
//    let id: Int
//    let name: String
//    let height: Int
//    let weight: Int
    
}

struct Pokemon: Decodable, Identifiable {
    let id: String
    let name: String
    let url: String
    let pokemonId: String
    let spriteUrl: String
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        url = try container.decode(String.self, forKey: .url)
        id = url
        pokemonId = url.getPokemonIdFromUrl()
        spriteUrl = "\(spriteBaseUrl)\(pokemonId).png"
        
    }
    
    // for dummy model
    init() {
        id = "1"
        name = "Bulbasaur"
        url = "https://pokeapi.co/api/v2/pokemon/1/"
        pokemonId = "1"
        spriteUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"
    }
        
}


extension String {
    func getPokemonIdFromUrl() -> String {
        do {
            let regex = try NSRegularExpression(pattern: "(\\d+)")
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            let stringArray = results.map {
                String(self[Range($0.range, in: self)!])
            }
            return stringArray[1]
            
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return ""
        }
    }
}


