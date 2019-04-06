//
//  HeaderCell.swift
//  ytb_phonenumber
//
//  Created by pm on 2019/4/3.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class DialedNumbersHeader: UICollectionReusableView {
    
    let numbersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(numbersLabel)
        numbersLabel.fillSuperview(padding: .init(top: 0, left: 32, bottom: 0, right: 32))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
