//
//  ApiCalls.swift
//  iOS-Testing-API
//
//  Created by Rogério Fidelix on 19/02/21.
//  Copyright © 2021 Rogério Fidelix. All rights reserved.
//

import Foundation

class ApiCalls {
    
    func fetchCharacters(completionHandler: @escaping (CharacterModel) -> Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let urlAPI = URL(string: "https://rickandmortyapi.com/api/character")
        var request = URLRequest(url: urlAPI!)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            if error != nil {
                print("Error is \(error!)")
                return
            } else if let jsonData = data,
                let test = try? JSONDecoder().decode(CharacterModel.self, from: jsonData) {
                print(test)
                completionHandler(test)
//                do {
//                    let parsedJson = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! [String: Any]
//                    print(parsedJson)
//                    if let results = parsedJson["results"] as? [[String:Any]] {
//                        print(results)
//                        for result in results {
//                            print(result)
//                            if let characterName = result["name"] as? String,
//                                let characterImage = result["image"] as? String {
//                                print(characterName, characterImage)
//                                self.characterModel?.characterName = characterName
//                                self.characterModel?.characterImage = characterImage
//                            }
//                        }
//                    }
//                } catch {
//                    print("Parsed Error is  \(error)")
//                }
            }
        })
        task.resume()
    }
    
    func fetchCharacter(characterId: String, completionHandler: @escaping (SingleCharacterModel) -> Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let urlAPI = URL(string: "https://rickandmortyapi.com/api/character/\(characterId)")
        var request = URLRequest(url: urlAPI!)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            if error != nil {
                print("Error is \(error!)")
                return
            } else if let jsonData = data,
                let test = try? JSONDecoder().decode(SingleCharacterModel.self, from: jsonData) {
                print(test)
                completionHandler(test)
            }
        })
        task.resume()
    }
    
    func fetchLocation(locationUrl: String, completionHandler: @escaping(LocationModel) -> Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let urlAPI = URL(string: locationUrl)
        var request = URLRequest(url: urlAPI!)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            if error != nil {
                print("Error is \(error!)")
                return
            } else if let jsonData = data,
                let test = try? JSONDecoder().decode(LocationModel.self, from: jsonData) {
                print(test)
                completionHandler(test)
            }
        })
        task.resume()
    }
}
