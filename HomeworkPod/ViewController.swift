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
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self as! UITableViewDelegate
        tableView.register(UITableViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.Pokemon = .getRandomPokemon()
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 1) {
            tableView.cellForRow(at: indexPath)?.Pokemon = .getRandomPokemon()
        }
    }
}

extension ViewController: UITableViewDelegateFlowLayout {
    func tableView(_ tableView: UITableView, layout tableViewLayout: UITableViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: tableView.frame.width / 5,
                      height: tableView.frame.height / 10)
    }
    
    func tableView(_ tableView: UITableView, layout tableViewLayout: UITableViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> Double {
        return 0
    }
    
    func tableView(_ tableView: UITableView, layout tableViewLayout: UITableViewLayout, minimumLineSpacingForSectionAt section: Int) -> Double {
        return 0
    }
}
extension UITableView {
    static func getRandomPokemon() -> Pokemon {
        _ = Int.random(in: 0...151)
        
        return Pokemon
    }
    Pokemon.species(withName: "name") { (results:[Pokemon]) in
    for result in results {
    print("\(result)\n\n")
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
    
    // Commit the write transaction
    // to make this data available to other threads
    try! realm.commitWrite()
    }
    }
    return Pokemon
    }
}




