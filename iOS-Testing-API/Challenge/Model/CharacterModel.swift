//
//  CharacterModel.swift
//  iOS-Testing-API
//
//  Created by Rogério Fidelix on 18/02/21.
//  Copyright © 2021 Rogério Fidelix. All rights reserved.
//

import Foundation

class CharacterModel: NSObject, Codable {
    let info: Info?
    let results: [Results]?
    
    private enum CodingKeys: String, CodingKey {
        case info
        case results
    }
}

class Info: NSObject, Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
    
    private enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
        case prev
    }
}

class Results: NSObject, Codable {
    let name: String?
    let image: String?
    let id: Int?
    let species: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case image
        case id
        case species
    }
}
