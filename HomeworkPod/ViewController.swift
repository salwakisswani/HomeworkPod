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
    var pokemonArray = [Pokemon]()
    let controller = PokemonController()
    // creates a new Pokemon Controller
    
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self as UITableViewDelegate
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        controller.getRandomPokemon(withName:"") {
          
            DispatchQueue.main.async {
                self.pokemonArray = self.controller.getAllPokemon()
                 self.tableView.reloadData()
                
            }
          
        }
        }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = pokemonArray[indexPath.row].name
        //how to access a property on an object
        
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        UIView.animate(withDuration: 1) {
//            tableView.cellForRow(at: indexPath)?.Pokemon = .getRandomPokemon()
//        }
    }
}




