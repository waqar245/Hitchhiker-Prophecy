//
//  NetworkService.swift
//  SwvlNetworking
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2018 Swvl Inc. All rights reserved.
//

import Alamofire

public class NetworkService: NSObject {
    // MARK: Stored Properties
    let client: SessionManager

    override public init() {
        client = SessionManager()        
        super.init()
    }
}
