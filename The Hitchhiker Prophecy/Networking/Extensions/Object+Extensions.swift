//
//  Object+Extensions.swift
//  The Hitchhiker Prophecy
//
//  Created by Waqar Ahmed on 5/4/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
