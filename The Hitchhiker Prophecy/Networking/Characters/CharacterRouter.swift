//
//  CharacterRouter.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

enum CharacterRouter: Router {
    static var name: String? = "public"
}

extension CharacterRouter {
    static func getCharacters(_ input: Characters.Search.Input) -> Request<Characters.Search.Output> {
        let url = generateURL("characters")
        let params = try? input.asDictionary()
        return Request(url: url,
                       params: params,
                       parse: {
                        try? JSONDecoder().decode(Characters.Search.Output.self, from: $0)
                        
        })
    }
}
