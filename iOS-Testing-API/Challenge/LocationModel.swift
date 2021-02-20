//
//  LocationModel.swift
//  iOS-Testing-API
//
//  Created by Rogério Fidelix on 20/02/21.
//  Copyright © 2021 Rogério Fidelix. All rights reserved.
//

import Foundation

class LocationModel: NSObject, Codable {
    let id: Int?
    let name: String?
    let type: String?
    let dimension: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case dimension
    }
}
