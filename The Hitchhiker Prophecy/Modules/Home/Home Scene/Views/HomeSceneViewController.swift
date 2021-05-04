//
//  HomeSceneViewController.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class HomeSceneViewController: UIViewController {
    
    var interactor: HomeSceneBusinessLogic?
    var router: HomeSceneRoutingLogic?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchCharacters()
    }
}

extension HomeSceneViewController: HomeSceneDisplayView {
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        // TODO: Implement
        print("This")
    }
    
    func failedToFetchCharacters(error: Error) {
        // TODO: Implement
        print("That")
    }
}
