//
//  NetworkError.swift
//  SwvlNetworking
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2018 Swvl Inc. All rights reserved.
//

import Alamofire

public enum NetworkError: Error {
    case
    server,
    cannotParseResponse,
    unknown
}
