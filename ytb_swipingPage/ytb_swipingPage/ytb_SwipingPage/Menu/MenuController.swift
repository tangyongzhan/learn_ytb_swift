//
//  MenuController.swift
//  ytb_SwipingPageProject
//
//  Created by pm on 2019/1/30.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit


protocol MenuControllerDelegate {
   func didTapSelectItme(indexPath: IndexPath)
}

class MenuController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    fileprivate let reuseIdentifier = "Cell"
    fileprivate let menuItems = ["Home", "News", "Profile"]
    
    var delegate: MenuControllerDelegate?
    
    let menuBar: UIView = {
        let v = UIView()
        v.backgroundColor = .black
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            layout.scrollDirection = .horizontal
        }
        collectionView.backgroundColor = .white
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        view.addSubview(menuBar)
        menuBar.anchor(top:nil, leading: view.leadingAnchor, bottom:  view.bottomAnchor, trailing: nil ,size: CGSize(width: view.frame.width / 3, height: 4))
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTapSelectItme(indexPath: indexPath)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuCell
        cell.label.text = menuItems[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/3, height: 44)
    }

}
