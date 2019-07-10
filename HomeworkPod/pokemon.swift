//
//  pokemon.swift
//  HomeworkPod
//
//  Created by Salwa Kisswani on 7/9/19.
//  Copyright © 2019 Salwa Kisswani. All rights reserved.
//

import Foundation
import RealmSwift


class Pokemon: Object, Decodable {
    @objc dynamic var name: String
//      @objc dynamic var species: String
//      @objc dynamic var identifier: Double
//      @objc dynamic var url: String
//      @objc dynamic var pokedexNumber: Int
    
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
        
    }
//    enum CodingKeys: String, CodingKey {
//        case name
//        case species
//        case identifier = "id"
//        case url
//        case pokedexNumber = "id"
//}

}
