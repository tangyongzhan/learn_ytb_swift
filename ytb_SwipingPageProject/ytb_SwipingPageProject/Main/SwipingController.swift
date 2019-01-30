//
//  ViewController.swift
//  ytb_SwipingPageProject
//
//  Created by pm on 2019/1/30.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "swiping"
        
        
        let menuController =  MenuController(collectionViewLayout: UICollectionViewFlowLayout())
        let menuView = menuController.view!
        
        view.addSubview(menuView)
        menuView.backgroundColor = .green
        menuView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: CGSize.init(width: 0, height: 44))
        
        collectionView.backgroundColor = .yellow
        collectionView.anchor(top: menuView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        
    }
    
    

}

