//
//  TestHomeSceneRouter.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Waqar Ahmed on 5/8/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class TestCharacterDetailsSceneInteractor: XCTestCase {
    
    var presenter = MockCharacterDetailsScenePresenter()
    var interactor: CharacterDetailsSceneInteractor!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        guard let character = Characters.Search.Character.map(JSONString: mockTestJson(.charactersDetailFile)) else {
            print("Unable to fetch character mock data")
            return
        }
        
        interactor = CharacterDetailsSceneInteractor(character: character,
                                                     presenter:presenter)
    }

    override func tearDownWithError() throws {}
    
    //Success Test to check if character is fetched and mapped poperly to model
    func testFetchCharacter() {

        interactor.fetchCharacter()
        
        guard let presenter = interactor.presenter as? MockCharacterDetailsScenePresenter else {
            print("Presenter not setup properly")
            return
        }
        
        let character = presenter.character
        
        XCTAssertEqual(character?.name, "Spider-Man")
        XCTAssertEqual(character?.resultDescription, "Bitten by a radioactive spider, high school student Peter Parker gained the speed, strength and powers of a spider. Adopting the name Spider-Man, Peter hoped to start a career using his new abilities. Taught that with great power comes great responsibility, Spidey has vowed to use his powers to help people.")
    }
}

class MockCharacterDetailsScenePresenter : CharacterDetailsScenePresentationLogic {
    
    var displayView: CharacterDetailsSceneDisplayLogic?
    var character:Characters.Search.Character?
    
    func presentCharacter(_ response: CharacterDetailsScene.FetchCharacter.Response) {
        
        character = response
    }
}

