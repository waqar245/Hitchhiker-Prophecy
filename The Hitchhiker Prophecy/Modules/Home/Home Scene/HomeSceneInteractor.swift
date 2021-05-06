//
//  HomeSceneInteractor.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class HomeSceneInteractor: HomeSceneDataStore {
    
    let worker: HomeWorkerType
    let presenter: HomeScenePresentationLogic
    
    var result: Characters.Search.Results?
    
    init(worker: HomeWorkerType, presenter: HomeScenePresentationLogic) {
        self.worker = worker
        self.presenter = presenter
    }
}

extension HomeSceneInteractor: HomeSceneBusinessLogic {
    
    var totalNumberOfCharacters: Int {
        return result?.total ?? 0
    }
    
    func fetchCharacters() {
        
        let ts = "1"
        let hash = "\(ts)\(NetworkConstants.privateKey)\(NetworkConstants.publicKey)".md5  // TODO: Implement
        let limit = HomeScene.Search.Constants.searchPageLimit
        let numberOfItemsFetched = result?.results.count ?? 0
        let total = result?.total ?? 0
        let offset = numberOfItemsFetched
        
        //Limit the requests at the end. If number of fetched characters is equal to total -> return
        if ((total > 0) && (numberOfItemsFetched >= total)) {
            return
        }
        
        let input = Characters.Search.Input(timeStamp: ts, apiKey: NetworkConstants.publicKey, hash: hash, offset: offset, limit: limit, orderBy: .modifiedDateDescending)
        
        worker.getCharacters(input) { [weak self] (result) in
            switch result {
            case .success(let value):
                var newData = value
                var oldCharacters = self?.result?.results ?? []
                oldCharacters.append(contentsOf: newData.data.results)
                newData.data.results = oldCharacters
                self?.result = newData.data
            case .failure(let error):
                print(error)
            }
            self?.presenter.presentCharacters(result)
        }
    }
}
