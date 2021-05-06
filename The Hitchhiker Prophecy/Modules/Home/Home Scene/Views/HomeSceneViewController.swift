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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Change Layout", style: .plain, target: self, action: #selector(onToggle))
        
        collectionView.collectionViewLayout = HomeChararctersVerticalLayout()
        
        collectionView.register(UINib(nibName: HomeCharacterCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: HomeCharacterCollectionViewCell.className)
        
        collectionView.register(UINib(nibName: LoadingCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: LoadingCollectionViewCell.className)
    }
    
    @objc func onToggle()   {
        
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
        
        var numberOfItems = characterViewModels.count
        
        let totalNumberOfCharacters = interactor?.totalNumberOfCharacters ?? 0
        
        //If total number of characters or all characters are not fetched so far, then add one extra cell to show for a loading spinner
        if (totalNumberOfCharacters == 0 || (characterViewModels.count < totalNumberOfCharacters)) {
            numberOfItems += 1
        }
        
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if (indexPath.item == characterViewModels.count - 1) {    //load more data
            interactor?.fetchCharacters()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (indexPath.item == characterViewModels.count) {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingCollectionViewCell.className, for: indexPath) as! LoadingCollectionViewCell
            
            cell.animateSpinner()
            
            return cell
        }
        else {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCharacterCollectionViewCell.className, for: indexPath) as! HomeCharacterCollectionViewCell
            
            let characterViewModel = characterViewModels[indexPath.item]
            
            cell.configure(with: characterViewModel)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        router?.routeToCharacterDetailsWithCharacter(at: indexPath.item)
    }
}
