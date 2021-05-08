//
//  HomeScenePresenter.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class HomeScenePresneter: HomeScenePresentationLogic {
    weak var displayView: HomeSceneDisplayView?
    
    init(displayView: HomeSceneDisplayView) {
        self.displayView = displayView
    }
    
    fileprivate func createViewModels(_ characters:[Characters.Search.Character]) -> [HomeScene.Search.ViewModel] {
            
            var viewModels = [HomeScene.Search.ViewModel]()
            
            for character in characters {

                let imagePath = "\(character.thumbnail.path)/\(HomeScene.Search.Constants.ImageSize.Portrait.incredible.rawValue).\(character.thumbnail.thumbnailExtension)"
                
                let viewModel = HomeScene.Search.ViewModel(name: character.name,
                                                           desc: character.resultDescription,
                                                           imageUrl: imagePath,
                                                           comics: character.comics.collectionURI,
                                                           series: character.series.collectionURI,
                                                           stories: character.stories.collectionURI,
                                                           events: character.events.collectionURI)
                
                viewModels.append(viewModel)
            }
            
            return viewModels
        }
    
    func presentCharacters(_ response: HomeScene.Search.Response) {
        // TODO: Implement
        
        switch response {
    
            case .success(let output):
                
                let characters = output.data.results
                
                let characterViewModels = self.createViewModels(characters)
                
                displayView?.didFetchCharacters(viewModel: characterViewModels)
                
            case .failure(let error):
                
                print(error.localizedDescription)
                
                displayView?.failedToFetchCharacters(error: error)
        }
    }
}
