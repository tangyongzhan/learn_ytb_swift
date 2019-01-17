//
//  ChatMenuItemCell.swift
//  ytb_twitterSlider
//
//  Created by pm on 2019/1/15.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class ChatMenuItemCell: UITableViewCell {
    
    let bgView: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.3803921569, green: 0.6374143836, blue: 0.5411764706, alpha: 1)
        v.layer.cornerRadius = 5
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(bgView)
        bgView.fillSuperview(padding: .init(top: 0, left: 8, bottom: 0, right: 8))
        sendSubviewToBack(bgView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        bgView.isHidden = !selected
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
