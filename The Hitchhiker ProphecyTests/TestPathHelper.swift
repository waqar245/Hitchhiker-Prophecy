//
//  TestPathHelper.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Waqar Ahmed on 5/8/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation

enum TestFileName: String {
    case charactersListFile     = "CharactersListTestJsonFile"
    case charactersDetailFile   = "CharactersDetailTestJsonFile"
}

func mockTestJson(_ url: TestFileName) -> String {
    
    if let path = Bundle.main.path(forResource: url.rawValue, ofType: "json") {
        do {
            
            print("SERVER REQUEST MOCK ~ \(url)")
            
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            
            let jsonData =  try JSONSerialization.data(withJSONObject: jsonResult, options: JSONSerialization.WritingOptions.prettyPrinted)
            if let convertedString = String(data: jsonData, encoding: String.Encoding.utf8) {
                return convertedString
            }
        } catch {
            // handle error
        }
    }
    
    return ""
}
