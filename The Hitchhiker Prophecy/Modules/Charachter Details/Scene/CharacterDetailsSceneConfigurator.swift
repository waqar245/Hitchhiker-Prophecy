//
//  CharacterDetailsSceneConfigurator.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Tarek on 6/15/20.
//  Copyright (c) 2020 SWVL. All rights reserved.
//
//  We are one more configurator colser to Egypt's First Unicorn 🦄
//

import UIKit

struct CharacterDetailsSceneConfigurator {
    static func configure(with character: Characters.Search.Character) -> CharacterDetailsSceneViewController {
        let viewController = CharacterDetailsSceneViewController()
        let presenter = CharacterDetailsScenePresenter(displayView: viewController)
        let interactor = CharacterDetailsSceneInteractor(character: character, presenter: presenter)
        
        viewController.interactor = interactor
        
        return viewController
    }
}
