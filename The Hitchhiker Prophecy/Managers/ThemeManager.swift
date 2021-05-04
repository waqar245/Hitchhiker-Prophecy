//
//  ThemeManager.swift
//  The Hitchhiker Prophecy
//
//  Created by Ehab Ashraf on 10/8/2020.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

enum ThemeManager {
    static func configure() {
        // MARK: - UIApperance
        configureNavigationBarAppearance()
    }
}

//MARK: - UINavigationBar Appearance
private extension ThemeManager {
    static func configureNavigationBarAppearance() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().tintColor = .white
    }
}
