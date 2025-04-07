//
//  Result.swift
//  PlanetIdentifier2
//
//  Created by Yoshi Miyakawa on 2025/04/07.
//

import Foundation

struct Result: Identifiable {
    
    let id = UUID()
    
    // The item the user was supposed to guess
    let item: Item
    
    // What the user actually guessed
    let guessProvided: String
    
    // Whether the user was correct or not
    let outcome: Outcome
    
}
