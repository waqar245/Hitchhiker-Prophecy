//
//  CharactersNetworkService.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

protocol CharactersUseCase {
    func getCharacters(_ input: Characters.Search.Input, completion: @escaping (Result<Characters.Search.Output, NetworkError>) -> Void)
}

class CharacterNetworkService: NetworkService, CharactersUseCase {
    func getCharacters(_ input: Characters.Search.Input, completion: @escaping (Result<Characters.Search.Output, NetworkError>) -> Void) {
        let request = CharacterRouter.getCharacters(input)
        client.request(request, completion: completion)
    }
}
