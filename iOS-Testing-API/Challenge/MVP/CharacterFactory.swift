//
//  CharacterFactory.swift
//  iOS-Testing-API
//
//  Created by Rogério Fidelix on 17/02/21.
//  Copyright © 2021 Rogério Fidelix. All rights reserved.
//

import Foundation
import UIKit

class CharacterFactory {
    var cells: [UITableViewCell] = []
    private let tableView: UITableView?
    private let characterModel: CharacterModel?
    
    init(tableView: UITableView,
         characterModel: CharacterModel) {
        self.tableView = tableView
        self.characterModel = characterModel
    }
    
    func loadCells() {
        registerCell()
        self.cells.append(contentsOf: loadCharacterCells())
    }
    
    private func registerCell() {
        tableView?.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "characterCell")
    }
    
    private func loadCharacterCells() -> [UITableViewCell] {
        var characterCells: [UITableViewCell] = []
        
        if let loopResults = characterModel?.results {
            for loop in loopResults {
//                print(loop.id)
                if let characterCell = tableView?.dequeueReusableCell(withIdentifier: "characterCell") as? CharacterCell {
                    
//                    let url = URL(string: loop.image ?? "")
//                    let data = try? Data(contentsOf: url!
                    
                    characterCell.setupCell(characterImage: SharedFuncs.init().urlToImage(from: loop.image ?? ""),
                                            characterLabel: loop.name ?? "")
                    
                    characterCells.append(characterCell)
                }
            }
        }
        return characterCells
    }
}
