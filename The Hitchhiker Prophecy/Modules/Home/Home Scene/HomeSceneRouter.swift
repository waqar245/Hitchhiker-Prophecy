//
//  HomeSceneRouter.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Tarek on 6/15/20.
//  Copyright (c) 2020 SWVL. All rights reserved.
//

import UIKit

final class HomeSceneRouter: HomeSceneDataPassing {
    // MARK: - Stored properties
    weak var viewController: (HomeSceneDisplayView & UIViewController)?
    var dataStore: HomeSceneDataStore?
    
    weak var presentingController:UIViewController?  //for testing puposes because unable to get viewController.presentedController in testing enviroment as there is no window set
}

// MARK: - HomeSceneRoutingLogic Methods
extension HomeSceneRouter: HomeSceneRoutingLogic {
    func routeToCharacterDetailsWithCharacter(at index: Int) {
        guard let character = dataStore?.result?.results[index] else { return }
        let characterDetailsViewController = CharacterDetailsSceneConfigurator.configure(with: character)
        self.presentingController = characterDetailsViewController
        viewController?.present(characterDetailsViewController, animated: true)
    }
}
