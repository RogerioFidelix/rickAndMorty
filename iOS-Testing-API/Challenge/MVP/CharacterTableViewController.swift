//
//  CharacterTableViewController.swift
//  iOS-Testing-API
//
//  Created by Rogério Fidelix on 17/02/21.
//  Copyright © 2021 Rogério Fidelix. All rights reserved.
//

import Foundation
import UIKit

class CharacterTableViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView?
    private var characterFactory: CharacterFactory?
    private let api = ApiCalls()
    
    private weak var characterModel: CharacterModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "RickAndMortyCharacters"
        api.fetchCharacters { (result) in
            print(result)
            DispatchQueue.main.async {
                self.characterModel = result
                self.loadCharacterTable(characterModel: result)
            }
        }
    }
    
    private func loadCharacterTable(characterModel: CharacterModel) {
        guard let tv = self.tableView else { return }
        
        characterFactory = CharacterFactory(tableView: tv,
                                            characterModel: characterModel)
        
        tv.delegate = self
        tv.dataSource = self
        characterFactory?.loadCells()
        tv.reloadData()
    }
}

extension CharacterTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterFactory?.cells.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return characterFactory?.cells[indexPath.row] ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let vc = CharacterDetailsViewController()
        vc.characterId = String(indexPath.row + 1)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
