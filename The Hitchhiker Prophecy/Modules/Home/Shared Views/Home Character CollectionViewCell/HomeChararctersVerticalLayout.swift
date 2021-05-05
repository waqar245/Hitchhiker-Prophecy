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

class HomeChararctersHorizontalLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
    }
    
    func setup() {
        
        let padding:CGFloat = 16.0
        let cellWidth:CGFloat = UIScreen.main.bounds.width - (padding * 2)
        let cellHeight:CGFloat = 526.0
        
        minimumLineSpacing = 8
        minimumInteritemSpacing = 16
        scrollDirection = .horizontal
        
        itemSize = CGSize(width: cellWidth, height: cellHeight)
        sectionInset = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
        
    }
}

