//
//  LoadingCollectionViewCell.swift
//  The Hitchhiker Prophecy
//
//  Created by Waqar Ahmed on 5/5/21.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

class LoadingCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var spinner:UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func animateSpinner()   {
        spinner.startAnimating()
    }
}
