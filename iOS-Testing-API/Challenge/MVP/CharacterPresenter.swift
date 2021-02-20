//
//  CharacterPresenter.swift
//  iOS-Testing-API
//
//  Created by Rogério Fidelix on 20/02/21.
//  Copyright © 2021 Rogério Fidelix. All rights reserved.
//

import Foundation

protocol CharacterPresenterProtocol: class {
    func showCharacter(name: String,
                       image: String,
                       species: String,
                       episodes: String,
                       location: String,
                       locationType: String)
}

final class CharacterPresenter {
    private var model: SingleCharacterModel?
    private var locationModel: LocationModel?
    weak var delegate: CharacterPresenterProtocol?
    private let api: ApiCalls = ApiCalls()
    
    func loadCharacterModel(characterId: String) {
        api.fetchCharacter(characterId: characterId) { [weak self] (characters) in
            if characters.location?.url == "" {
                DispatchQueue.main.async {
                    self?.model = characters
                    self?.loadLayout()
                }
            } else {
                self?.api.fetchLocation(locationUrl: characters.location?.url ?? "") { [weak self] (location) in
                    DispatchQueue.main.async {
                        print(location)
                        self?.model = characters
                        self?.locationModel = location
                        self?.loadLayout()
                    }
                }
            }
        }
    }
    
    func loadLayout() {
        delegate?.showCharacter(name: model?.name ?? "",
                                image: model?.image ?? "",
                                species: model?.species ?? "",
                                episodes: String(model?.episode?.count ?? 0),
                                location: model?.location?.name ?? "",
                                locationType: locationModel?.type ?? "unknown")
    }
}
