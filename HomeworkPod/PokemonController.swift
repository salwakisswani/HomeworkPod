//
//  PokemonController.swift
//  HomeworkPod
//
//  Created by Salwa Kisswani on 7/10/19.
//  Copyright © 2019 Salwa Kisswani. All rights reserved.
//

import Foundation
import RealmSwift

class PokemonController {
    
    
    
    let basePath = "https://pokeapi.co/api/v2/pokemon/\(Int.random(in: 1...151))"
    func getRandomPokemon (withName name:String, completion: @escaping () -> ()) {
        
        let url = URL(string: basePath)
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) {(data:Data?, response:URLResponse?, error:Error?) in
            var pokemonArray: [Pokemon] = []
            if let data = data {
                
                do{
                    let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                    let realm = try! Realm()
                    try realm.write {
                        realm.add(pokemon)
                        completion()
                    }
                    }catch {
                        print(error.localizedDescription)
                    }
    
                }
            }.resume()
        //don't forget resume
            
        }
    func getAllPokemon() -> [Pokemon] {
        //set of pokemons
        let realm = try! Realm()
        let pokemonResults = realm.objects(Pokemon.self)
        return Array(pokemonResults)
        //get an array of Pokemon
        
    }
    
        
    }


