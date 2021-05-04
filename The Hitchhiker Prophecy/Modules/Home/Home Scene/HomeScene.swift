//
//  HomeScene.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

enum HomeScene {
    enum Search { }
    enum LayoutType {
        case list
        case peek
    }
}

extension HomeScene.Search {
    typealias Response = Result<Characters.Search.Output, NetworkError>
    
    struct ViewModel {
        var name: String
        var desc: String
        var imageUrl: String
        var comics: String
        var series: String
        var stories: String
        var events: String
    }
}

extension HomeScene.Search {
    enum Constants {
        static let searchPageLimit = 10
        
        enum ImageSize {
            enum Standard: String {
                case Small = "standard_small"
                case Medium = "standard_medium"
                case Large = "standard_large"
                case Xlarge = "standard_xlarge"
                case Fantastic = "standard_fantastic"
                case Amazing = "standard_amazing"
            }
            
            enum Portrait: String {
                case small = "portrait_small"
                case medium = "portrait_medium"
                case xlarge = "portrait_xlarge"
                case fantastic = "portrait_fantastic"
                case uncanny = "portrait_uncanny"
                case incredible = "portrait_incredible"
            }
        }
    }
}
