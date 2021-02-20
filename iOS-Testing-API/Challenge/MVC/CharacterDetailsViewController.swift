//
//  CharacterDetailViewController.swift
//  iOS-Testing-API
//
//  Created by Rogério Fidelix on 19/02/21.
//  Copyright © 2021 Rogério Fidelix. All rights reserved.
//

import Foundation
import UIKit

class CharacterDetailsViewController: UIViewController {
    @IBOutlet private weak var characterName: UILabel?
    @IBOutlet private weak var characterImage: UIImageView?
    @IBOutlet private weak var characterSpecies: UILabel?
    @IBOutlet private weak var characterEpisodes: UILabel?
    @IBOutlet private weak var characterOrigin: UILabel?
    @IBOutlet private weak var characterOriginType: UILabel?
    
//    private let api = ApiCalls()
//    private var model: SingleCharacterModel?
    private var presenter: CharacterPresenter?
    var characterId: String?
    var locationUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CharacterDetails"
        presenter = CharacterPresenter()
        presenter?.loadCharacterModel(characterId: characterId ?? "")
        presenter?.delegate = self
    }
}

extension CharacterDetailsViewController: CharacterPresenterProtocol {
    func showCharacter(name: String, image: String, species: String,
                       episodes: String, location: String, locationType: String) {
        characterName?.text = name
        characterImage?.image = SharedFuncs.init().urlToImage(from: image)
        characterSpecies?.text = species
        characterEpisodes?.text = episodes
        characterOrigin?.text = location
        characterOriginType?.text = locationType
    }
}
