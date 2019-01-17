//
//  MenuItemCell.swift
//  ytb_twitterSlider
//
//  Created by pm on 2019/1/13.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class IconImageView: UIImageView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 32, height: 32)
    }
}

class MenuItemCell: UITableViewCell {
    let kMargin: CGFloat = 16
    var titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    var iconImageView : IconImageView = {
        let iv = IconImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLable.text = textLabel?.text
        iconImageView.image = imageView?.image
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLable, UIView()])
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        stackView.spacing = kMargin
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: kMargin, left: kMargin, bottom: kMargin, right: kMargin)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
