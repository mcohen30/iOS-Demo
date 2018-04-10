//
//  Starship.swift
//  StarshipViewer
//
//  Created by Mazlow Cohen on 4/9/18.
//  Copyright © 2018 Mazlow Cohen. All rights reserved.
//

import Foundation

struct Starships: Codable{
    let results: [Starship]
}

struct Starship: Codable{
    
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
    
    
}
