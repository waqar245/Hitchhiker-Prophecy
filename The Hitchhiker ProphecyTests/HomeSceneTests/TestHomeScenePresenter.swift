//
//  TestHomeScenePresenter.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Waqar Ahmed on 5/8/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class TestHomeScenePresenter: XCTestCase {
    
    override func setUpWithError() throws {}
    override func tearDownWithError() throws {}
    
    //Success Test to check if view models are created properly
    func testPresenterShouldPresentCharacterViewModels() {
        
        let displayView = HomeSceneTestPresenterDisplayView()
        let presenter = HomeScenePresneter(displayView: displayView)
        
        //Load data from mock json
        let charactersResult: Characters.Search.Output = Characters.Search.Output.map(JSONString: mockTestJson(.charactersListFile))!
        
        presenter.presentCharacters(.success(charactersResult))
        
        //Test if created view models are correct
        XCTAssertEqual(displayView.characterViewModels.count, 2)
        XCTAssertEqual(displayView.characterViewModels.first?.name, "Hulk")
        XCTAssertEqual(displayView.characterViewModels.last?.name, "Doctor Strange")
    }
    
    //Fail Test to check if failure to present is handled
    func testPresenterFailedToCreateCharacterViewModels() {
        
        let displayView = HomeSceneTestPresenterDisplayView()
        let presenter = HomeScenePresneter(displayView: displayView)
        
        presenter.presentCharacters(.failure(NetworkError.cannotParseResponse))
        
        XCTAssertFalse(displayView.error == nil)
    }
}

//Mock Test Presenter Dispaly View
final class HomeSceneTestPresenterDisplayView: HomeSceneDisplayView {
    
    var interactor: HomeSceneBusinessLogic?
    var router: HomeSceneRoutingLogic?
    
    var characterViewModels = [HomeScene.Search.ViewModel]()
    var error: Error?
    
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        characterViewModels = viewModel
    }
    
    func failedToFetchCharacters(error: Error) {
        self.error = error
    }
    
}
