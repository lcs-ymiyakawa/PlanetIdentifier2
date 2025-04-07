//
//  Item.swift
//  PlanetIdentifier2
//
//  Created by Yoshi Miyakawa on 2025/04/07.
//

import Foundation

struct Item: Identifiable {
    
    let id = UUID()
    let word: String
    let imageName: String
    
}

// Create the list of items that can be spelled
let itemsToSpell = [
    
    Item(word: "Earth",
         imageName: "Earth"),
    
    Item(word: "Neptune",
         imageName: "Neptune"),
    
    Item(word: "Mars",
         imageName: "Mars"),
    
    Item(word: "Mercury",
         imageName: "Mercury"),
    
    Item(word: "Uranus",
         imageName: "Uranus"),
    
    Item(word: "Saturn",
         imageName: "Saturn"),
    
    Item(word: "Venus",
         imageName: "Venus"),
 
]
