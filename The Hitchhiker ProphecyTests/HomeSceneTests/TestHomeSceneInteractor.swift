//
//  TestHomeSceneInteractor.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Waqar Ahmed on 5/8/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class TestHomeSceneInteractor: XCTestCase {

    var interactor: HomeSceneInteractor!
    
    let presenter = TestPresenter()
    let worker = TestHomeWorker()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        interactor = HomeSceneInteractor(worker: worker, presenter: presenter)
    }

    override func tearDownWithError() throws {}
    
    let charactersResult = Characters.Search.Output.map(JSONString: mockTestJson(.charactersListFile))!
    
    //Success Test to check if characters are fetched and decoded poperly to models
    func testWorkerSuccessToFetchCharacters() {

        worker.result = .success(charactersResult)
        interactor.fetchCharacters()

        let characters = interactor.result?.results
        
        XCTAssertEqual(characters?.count, 2)
        XCTAssertEqual(characters?.first?.name, "Hulk")
        XCTAssertEqual(characters?.last?.name, "Doctor Strange")
    }
    
    //Fail Test to check if somethig like network failure is routed
    func testWorkerFailToFetchCharacters() {
        
        worker.result = .failure(NetworkError.server)
        interactor.fetchCharacters()
        
        switch worker.result {
            case .failure(let errorType):
                XCTAssertEqual(errorType, NetworkError.server)
            default:
                XCTFail("should be case failure instead success")
        }
    }
}


class TestPresenter: HomeScenePresentationLogic {
    var displayView: HomeSceneDisplayView?
    
    func presentCharacters(_ response: HomeScene.Search.Response) {}
}

class TestHomeWorker: HomeWorkerType {

    var result:HomeScene.Search.Response?
    
    //Method defined in Protocol - Will have to test this
    
    func getCharacters(_ input: Characters.Search.Input,
              completion: @escaping (HomeScene.Search.Response) -> Void) {
    
        guard let result = result else {
            XCTFail("Did not supply fake results in Test Worker")
            return
        }
        
        completion(result)
    }
}
