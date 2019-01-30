//
//  MenuCell.swift
//  ytb_SwipingPageProject
//
//  Created by pm on 2019/1/30.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "menu item"
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override var isSelected: Bool {
        didSet{
            label.textColor = isSelected ? .black: .lightGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
