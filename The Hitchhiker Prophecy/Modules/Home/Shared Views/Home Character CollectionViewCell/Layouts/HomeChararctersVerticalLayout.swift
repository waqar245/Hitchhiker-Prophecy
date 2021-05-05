//
//  HomeChararctersVerticalLayout.swift
//  The Hitchhiker Prophecy
//
//  Created by Waqar Ahmed on 5/4/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

class HomeChararctersVerticalLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
    }
    
    func setup() {
        
        let cellWidth:CGFloat = UIScreen.main.bounds.width
        let cellHeight:CGFloat = 186.0
        
        minimumLineSpacing = 4
        scrollDirection = .vertical
        
        itemSize = CGSize(width: cellWidth, height: cellHeight)
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
}



