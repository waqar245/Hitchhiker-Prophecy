//
//  CharacterDetailsSceneInteractor.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Tarek on 6/15/20.
//  Copyright (c) 2020 SWVL. All rights reserved.
//
//  Looks like you're cooking something intersting 🚀
//

final class CharacterDetailsSceneInteractor: CharacterDetailsSceneDataStore {
    // MARK: - Stored properties
    let character: Characters.Search.Character
    let presenter: CharacterDetailsScenePresentationLogic
    
    // MARK: Init
    init(character: Characters.Search.Character, presenter: CharacterDetailsScenePresentationLogic) {
        self.character = character
        self.presenter = presenter
    }
}

// MARK: - CharacterDetailsBusinessLogic methods
extension CharacterDetailsSceneInteractor: CharacterDetailsSceneBusinessLogic {
    func fetchCharacter() {
        presenter.presentCharacter(character)
    }
}
