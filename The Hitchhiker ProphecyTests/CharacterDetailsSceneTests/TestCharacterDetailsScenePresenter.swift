//
//  TestCharacterDetailsScenePresenter.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Waqar Ahmed on 5/8/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class TestCharacterDetailsScenePresenter: XCTestCase {
    
    var displayView = TestCharacterDetailsSceneDisplayLogic()
    var presenter: CharacterDetailsScenePresenter!
    var interactor: CharacterDetailsSceneInteractor!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        guard let character = Characters.Search.Character.map(JSONString: mockTestJson(.charactersDetailFile)) else {
            print("Unable to fetch character mock data")
            return
        }
        
        presenter = CharacterDetailsScenePresenter(displayView: displayView)
        
        interactor = CharacterDetailsSceneInteractor(character: character,
                                                     presenter:presenter)
        
        displayView.interactor = interactor
    }

    override func tearDownWithError() throws {}
    
    //Success Test to check if character is fetched and mapped poperly to view model
    func testFetchCharacter() {

        interactor.fetchCharacter()
        
        guard let displayView = interactor.presenter.displayView as? TestCharacterDetailsSceneDisplayLogic else {
            print("Display view not setup properly")
            return
        }
        
        let characterViewModel = displayView.fetchedViewModel
        
        XCTAssertEqual(characterViewModel?.name, "Spider-Man")
        XCTAssertEqual(characterViewModel?.description.isEmpty, false)
    }
}

class TestCharacterDetailsSceneDisplayLogic: CharacterDetailsSceneDisplayLogic {
    
    var interactor: CharacterDetailsSceneBusinessLogic?
    var fetchedViewModel: CharacterDetailsScene.FetchCharacter.ViewModel?
    
    func didFetchCharacter(viewModel: CharacterDetailsScene.FetchCharacter.ViewModel) {
        
        self.fetchedViewModel = viewModel
    }
    
}
