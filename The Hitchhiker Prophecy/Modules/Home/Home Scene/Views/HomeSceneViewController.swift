//
//  HomeSceneViewController.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class HomeSceneViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var interactor: HomeSceneBusinessLogic?
    var router: HomeSceneRoutingLogic?
    
    var characterViewModels = [HomeScene.Search.ViewModel]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
        interactor?.fetchCharacters()
    }
    
    func setupUI()  {
        
        collectionView.collectionViewLayout = HomeChararctersVerticalLayout()
        
        collectionView.register(UINib(nibName: HomeCharacterCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: HomeCharacterCollectionViewCell.className)
    }
    
    @IBAction func onToggle()   {
        
        if let currentLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            let newLayout = (currentLayout.scrollDirection == .vertical) ? HomeChararctersHorizontalLayout() : HomeChararctersVerticalLayout()
            
            collectionView.setCollectionViewLayout(newLayout, animated: true)
        }
    }
    
}

extension HomeSceneViewController: HomeSceneDisplayView {
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        // TODO: Implement
        
        characterViewModels.append(contentsOf: viewModel)
        collectionView.reloadData()
    }
    
    func failedToFetchCharacters(error: Error) {
        // TODO: Implement
        print("That")
    }
}

extension HomeSceneViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return characterViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCharacterCollectionViewCell.className, for: indexPath) as?  HomeCharacterCollectionViewCell
        
        let characterViewModel = characterViewModels[indexPath.row]
        
        cell?.configure(with: characterViewModel)
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        router?.routeToCharacterDetailsWithCharacter(at: indexPath.row)
    }
}
