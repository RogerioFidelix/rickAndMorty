//
//  SingleCharacterModel.swift
//  iOS-Testing-API
//
//  Created by Rogério Fidelix on 19/02/21.
//  Copyright © 2021 Rogério Fidelix. All rights reserved.
//

import Foundation

class SingleCharacterModel: NSObject, Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Origin?
    let location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case type
        case gender
        case origin
        case location
        case image
        case episode
        case url
        case created
    }
}

class Origin: NSObject, Codable {
    let name: String?
    let url: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

class Location: NSObject, Codable {
    let name: String?
    let url: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
