//
//  Decodable+Extensions.swift
//  The Hitchhiker Prophecy
//
//  Created by Waqar Ahmed on 5/8/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation

extension Decodable {
    static func map(JSONString:String) -> Self? {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(Self.self, from: Data(JSONString.utf8))
        } catch let error {
            print(error)
            return nil
        }
    }
}
