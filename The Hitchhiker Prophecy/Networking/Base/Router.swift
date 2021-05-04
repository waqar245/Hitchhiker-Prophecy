//
//  Router.swift
//  SwvlNetworking
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2018 Swvl Inc. All rights reserved.
//
import Foundation

protocol Router {
    static var rootURL: String { get }
    static var name: String? { get }
    static var apiVersion: String? { get }
}

extension Router {
    static var apiVersion: String? {
        return "v1"
    }

    static var name: String? {
        return nil
    }

    static var rootURL: String {
        return NetworkConstants.baseUrl
    }

    static func generateURL(_ components: String...) -> URL {
        let urlString = URLStringGenerator.resource(name, root: rootURL, apiVersion: apiVersion)(components)
        if let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            return URL(string: encodedString)!
        }
        return URL(string: urlString)!
    }
}
