//
//  pokemon.swift
//  HomeworkPod
//
//  Created by Salwa Kisswani on 7/9/19.
//  Copyright © 2019 Salwa Kisswani. All rights reserved.
//

import Foundation
import RealmSwift


struct Pokemon {
    let name: String
    let species: String
    let identifier: Double
    let url: String
    let pokedexNumber: Int
    
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
        
    }
    
    init(json:[String:Any]) throws {
        guard let species = json["species"] as? String else { throw SerializationError.missing("Species is missing")}
        guard let name = json["name"] as? String else { throw SerializationError.missing("name is missing")}
        guard let identifier = json["id"] as? Double else { throw SerializationError.missing("Identifier is missing")}
        guard let url = json["url"] as? String else { throw SerializationError.missing("url is missing")}
        
        self.species = ""
        self.identifier = 0
        self.name = ""
        self.url = ""
        self.pokedexNumber = Int(identifier)
        
        
    }
    static let basePath = "https://pokeapi.co/api/v2/pokemon/\(pokedexNumber)"
    static func Pokemon (withName Name:String, completion: @escaping ([Pokemon]) -> ()) {
        
        let url = basePath + Name
        let request = URLRequest(url:URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) {(data:Data?, response:URLResponse?, error:Error?) in
            var pokemonArray: [Pokemon] = []
            let realm = try! Realm()
            if let data = data {
                
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        try! realm.write {
                            if let speciesInfo = json["species"] as? [String:Any] {
                                if let namePokemon = speciesInfo["name"] as? [[String:Any]] {
                                    for idPokemon in speciesInfo {
                                        if let pokemonInfo = try? Pokemon(json: speciesInfo) {
                                            pokemonArray.append(pokemonInfo)
                                        }
                                    }
                                }
                            }
                            
                        }
                    }catch {
                        print(error.localizedDescription)
                    }
                    completion(pokemonArray)
                }
            }
            
        }
    }
}
