//
//  MessagesListController.swift
//  ytb_lbtatools
//
//  Created by pm on 2019/5/18.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit
import LBTATools


class MessagesListController: LBTAListHeaderController<MessageCell,Message, Header>, UICollectionViewDelegateFlowLayout{

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 200)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        items = [
            .init(image: UIImage(named: "girl"), name: "Girl geeney 1", message: "Hello my name is geeney!!"),
            .init(image: UIImage(named: "girl"), name: "Girl geeney 2", message: "Hello my name is geeney!!"),
            .init(image: UIImage(named: "girl"), name: "Girl geeney 3", message: "Hello my name is geeney!!"),
            .init(image: UIImage(named: "girl"), name: "Girl geeney 4", message: "Hello my name is geeney!!"),
            .init(image: UIImage(named: "girl"), name: "Girl geeney 5", message: "Hello my name is geeney!!"),
            .init(image: UIImage(named: "girl"), name: "Girl geeney 6", message: "Hello my name is geeney!!"),
            .init(image: UIImage(named: "girl"), name: "Girl geeney 7", message: "Hello my name is geeney!!"),
            .init(image: UIImage(named: "girl"), name: "Girl geeney 8", message: "Hello my name is geeney!!"),
            .init(image: UIImage(named: "girl"), name: "Girl geeney 9", message: "Hello my name is geeney!!"),
        ]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 120)
    }
    
}
