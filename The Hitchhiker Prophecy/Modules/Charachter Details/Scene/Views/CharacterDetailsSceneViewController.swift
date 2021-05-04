//
//  CharacterDetailsSceneViewController.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Tarek on 6/15/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class CharacterDetailsSceneViewController: UIViewController {
    // MARK: - Stored Properties
    var interactor: CharacterDetailsSceneBusinessLogic?
    
    // MARK: - Outlets
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchCharacter()
    }
}

// MARK: - CharacterDetailsSceneDisplayView Methods
extension CharacterDetailsSceneViewController: CharacterDetailsSceneDisplayLogic {
    func didFetchCharacter(viewModel: CharacterDetailsScene.FetchCharacter.ViewModel) {
        characterNameLabel.text = viewModel.name
        characterDescriptionLabel.text = viewModel.description
        if let url = URL(string: viewModel.imageURL) {
            setupImageViewGradient()
            characterImageView.af_setImage(withURL: url, placeholderImage: UIImage(named: "placeHolder"))
        } else {
            characterImageView.image = UIImage(named:"placeHolder")
        }
    }
}

// MARK: - Helpers
extension CharacterDetailsSceneViewController {
    private func setupImageViewGradient() {
        let maskLayer = CAGradientLayer(layer: characterImageView.layer)
        maskLayer.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
        maskLayer.startPoint = CGPoint(x: 0, y: 0)
        maskLayer.endPoint = CGPoint(x: 0, y: 0.85)
        maskLayer.frame = characterImageView.bounds
        characterImageView.layer.mask = maskLayer
    }
}
