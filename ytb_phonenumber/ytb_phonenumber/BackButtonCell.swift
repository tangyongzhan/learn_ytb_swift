//
//  GreenPhoneButtonCell.swift
//  ytb_phonenumber
//
//  Created by pm on 2019/4/4.
//  Copyright © 2019 pm. All rights reserved.
//



import UIKit

class BackButtonCell: UICollectionViewCell {
    
    
    let backImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "phone_backspace")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backImageView)
        backImageView.centerInSuperview(size: .init(width: 28, height: 28))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
