//
//  AppWindowManager.swift
//  The Hitchhiker Prophecy
//
//  Created by Ehab Ashraf on 10/8/2020.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

enum AppWindowManager {
    static func setupWindow() {
        let window = self.window ?? UIWindow.init(frame: windowFrame)
        let controller = HomeSceneConfigurator.configure()
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
}

private extension AppWindowManager {
    static var window: UIWindow? {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)?.window
        }
        set {
            (UIApplication.shared.delegate as? AppDelegate)?.window = newValue
        }
    }

    static var windowFrame: CGRect {
        return UIScreen.main.bounds
    }
}
