//
//  SharedFuncs.swift
//  iOS-Testing-API
//
//  Created by Rogério Fidelix on 19/02/21.
//  Copyright © 2021 Rogério Fidelix. All rights reserved.
//

import Foundation
import UIKit

class SharedFuncs {
    
    func urlToImage(from url: String) -> UIImage {
        let url = URL(string: url)
        let data = try? Data(contentsOf: url!)
        return UIImage(data: data!)!
    }
    
    func searchForEmptyString(string: String) -> String {
        if string == "" {
            return "unknown"
        } else {
            return string
        }
    }
}
