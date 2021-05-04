//
//  HomeWorker.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class HomeSearchWorker: HomeWorkerType {
    private let service = CharacterNetworkService()
    func getCharacters(_ input: Characters.Search.Input,
              completion: @escaping (HomeScene.Search.Response) -> Void) {
        service.getCharacters(input) { result in
            let response: HomeScene.Search.Response
            defer { completion(response) }
            switch result {
            case .success(let output):
                response = .success(output)
            case .failure(let error):
                response = .failure(error)
            }
        }
    }
}
