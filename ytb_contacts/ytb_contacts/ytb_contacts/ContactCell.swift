//
//  ContactCell.swift
//  ytb_contacts
//
//  Created by pm on 2019/1/4.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    var links: HomeController? = HomeController()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let button = UIButton(type:.system)
        button.setImage(UIImage(named: "btn_live_normal"), for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(handleMarkSomeOneLike), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        accessoryView = button
        
        
    }
    
    @objc func handleMarkSomeOneLike(button: UIButton){
        links?.markSomeOneLike(cell:self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
