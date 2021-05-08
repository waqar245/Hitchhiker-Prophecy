//
//  TestHomeSceneRouter.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Waqar Ahmed on 5/8/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import XCTest
@testable import The_Hitchhiker_Prophecy

class TestHomeSceneRouter: XCTestCase {
    
    var homeSceneRouter: HomeSceneRouter!
    let viewController = HomeSceneViewController()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        homeSceneRouter = HomeSceneRouter()
        homeSceneRouter.viewController = viewController
        homeSceneRouter.dataStore = TestDataStore()
    }
    
    func testCharacterDetailsViewControllerIsPresented() {
        
        homeSceneRouter.routeToCharacterDetailsWithCharacter(at: 0)
        
        XCTAssertTrue(homeSceneRouter.presentingController is CharacterDetailsSceneViewController)
    }
}

class TestDataStore: HomeSceneDataStore {
    
    var result: Characters.Search.Results?
    
    let charactersResult = Characters.Search.Output.map(JSONString: mockTestJson(.charactersListFile))!
    
    init() {
        let dataResults = charactersResult.data
        
        result = Characters.Search.Results(offset: dataResults.offset,
                                           limit: dataResults.limit,
                                           total: dataResults.total,
                                           count: dataResults.count,
                                           results: dataResults.results)
    }
    
}
