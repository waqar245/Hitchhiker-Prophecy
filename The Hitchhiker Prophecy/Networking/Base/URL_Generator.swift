//
//  URL_Generator.swift
//  SwvlNetworking
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2018 Swvl Inc. All rights reserved.
//

enum URLStringGenerator {
    private static func generatePath(for resource: String?, root: String, apiVersion: String?) -> String {
        var url = root

        if let apiVersion = apiVersion {
            url += "/" + apiVersion
        }

        if let resource = resource {
            url += "/" + resource
        }

        return url
    }

    static func resource(_ resource: String?, root: String, apiVersion: String?) -> ([String]) -> String {
        return { (components: [String]) in
            var uri = generatePath(for: resource, root: root, apiVersion: apiVersion)

            if !components.isEmpty {
                uri += "/" + components.joined(separator: "/")
            }

            return uri
        }
    }
}
