//
//  KeyCell.swift
//  ytb_phonenumber
//
//  Created by pm on 2019/4/3.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class KeyCell: UICollectionViewCell {
    
    let numberLable:UILabel = {
        let label = UILabel()
        label.text = "8"
        
        label.textAlignment = .center
        label.font = UIDevice.current.screenType == .iPhones_5_5s_5c_SE ? .systemFont(ofSize: 24) : .systemFont(ofSize: 32)
        return label
    }()
    
    let wordLable:UILabel = {
        let label = UILabel()
        label.text = "ABC"
        label.textAlignment = .center
        label.font = UIDevice.current.screenType == .iPhones_5_5s_5c_SE ? .systemFont(ofSize: 8): .systemFont(ofSize: 10)
        return label
    }()
    
    fileprivate let defaultBGColor = UIColor(white: 0.9, alpha: 1)
    
    override var isHighlighted: Bool {
        didSet{
            backgroundColor = isHighlighted ? .black : defaultBGColor
            numberLable.textColor = isHighlighted ? .white : .black
            wordLable.textColor = isHighlighted ? .white : .black
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = defaultBGColor
        
        let statckView = UIStackView(arrangedSubviews: [
            numberLable,
            wordLable
            ])
        statckView.axis = .vertical
        
        addSubview(statckView)
        statckView.centerInSuperview()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
