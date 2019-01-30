//
//  MainCell.swift
//  ytb_SwipingPageProject
//
//  Created by pm on 2019/1/30.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class MainCell: UICollectionViewCell {
    let newsController = NewsController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        let newsView = newsController.view!
        addSubview(newsView)
        newsView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
       
        
    }

}
