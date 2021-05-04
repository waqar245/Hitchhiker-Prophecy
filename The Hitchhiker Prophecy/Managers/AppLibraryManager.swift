//
//  AppLibrary.swift
//  The Hitchhiker Prophecy
//
//  Created by Ehab Ashraf on 10/8/2020.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Alamofire
import AlamofireImage

enum AppLibManager {
    static func configure() {
        Alamofire.DataRequest.addAcceptableImageContentTypes(["image/jpg"])
    }
}
