//
//  ViewController.swift
//  HomeworkPod
//
//  Created by Salwa Kisswani on 7/9/19.
//  Copyright © 2019 Salwa Kisswani. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController{

    
 class Pokemon {
    let name: String = ""
    let species: String = ""
    let identifier: Double = 0.0
    let url: String = ""
    let pokedexNumber: Int = 0
    }
        
    @IBOutlet weak var tableView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Pokemon.Pokemon(withName: "") { (results:[Pokemon]) in
            for result in results {
                print("\(result)\n\n")
            }
        }
     
        
    }

//    // Application Code
//    func updateUserFromServer() {
//        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokedexNumber)")
//        URLSession.shared.dataTask(with: url!) { data, _, _ in
//            let realm = try! Realm()
//            self.identifier = 0
//            self.pokedexNumber = Int(identifier)
//            self.createOrUpdateUser(in: realm, with: data!)
//        }
//    }
//
//    public func createOrUpdateUser(in realm: Realm, with data: Data) {
//        let object = try! JSONSerialization.jsonObject(with: data) as! [String: String]
//        try! realm.write {
//            realm.create(User.self, value: object, update: .modified)
//        }
//    }
    
    DispatchQueue(label: "tableView").async {
    autoreleasepool {
    // Get realm and table instances for this thread
    let realm = try! Realm()
    
    // Break up the writing blocks into smaller portions
    // by starting a new transaction
    for pokedexNumber in 1..<151 {
    realm.beginWrite()
    
    // Add row via dictionary. Property order is ignored.
    realm.create(Person.self, value: [
    "name": "\(pokedexNumber)"
    ])
    }
    
    // Commit the write transaction
    // to make this data available to other threads
    try! realm.commitWrite()
    }
    }
}


