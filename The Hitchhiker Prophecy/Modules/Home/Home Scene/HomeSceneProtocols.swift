//
//  HomeSceneProtocols.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/12/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

protocol HomeSceneDisplayView: class {
    var interactor: HomeSceneBusinessLogic? { get }
    var router: HomeSceneRoutingLogic? { get }
    
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel])
    func failedToFetchCharacters(error: Error)
}

protocol HomeSceneBusinessLogic: class {
    var worker: HomeWorkerType { get }
    var presenter: HomeScenePresentationLogic { get }
    
    func fetchCharacters()
}

protocol HomeScenePresentationLogic: class {
    var displayView: HomeSceneDisplayView? { get }
    
    func presentCharacters(_ response: HomeScene.Search.Response)
}

protocol HomeSceneDataStore: class {
    var result: Characters.Search.Results? { get }
}

protocol HomeSceneDataPassing: class {
    var dataStore: HomeSceneDataStore? { get }
}

protocol HomeSceneRoutingLogic: class {
    var viewController: (HomeSceneDisplayView & UIViewController)? { get }
    
    func routeToCharacterDetailsWithCharacter(at index: Int)
}

protocol HomeWorkerType {
    func getCharacters(_ input: Characters.Search.Input, completion: @escaping (HomeScene.Search.Response) -> Void)
}
