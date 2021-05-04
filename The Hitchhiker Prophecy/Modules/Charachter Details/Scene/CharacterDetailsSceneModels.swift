//
//  CharacterDetailsSceneModels.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Tarek on 6/15/20.
//  Copyright (c) 2020 SWVL. All rights reserved.
//
//  Lets model it 🕺🏽💃🏽
//

enum CharacterDetailsScene {
    enum FetchCharacter { }
    enum Constants {}
}

extension CharacterDetailsScene.FetchCharacter {
    typealias Response = Characters.Search.Character
    
    struct ViewModel {
        let name: String
        let description: String
        let imageURL: String
    }
}

// MARK: - Constants
extension CharacterDetailsScene.Constants {
    enum ImageSize {
        enum Standard: String {
            case Small = "standard_small"
            case Medium = "standard_medium"
            case Large = "standard_large"
            case Xlarge = "standard_xlarge"
            case Fantastic = "standard_fantastic"
            case Amazing = "standard_amazing"
        }
        
        enum Portrait: String {
            case small = "portrait_small"
            case medium = "portrait_medium"
            case xlarge = "portrait_xlarge"
            case fantastic = "portrait_fantastic"
            case uncanny = "portrait_uncanny"
            case incredible = "portrait_incredible"
        }
    }
}
