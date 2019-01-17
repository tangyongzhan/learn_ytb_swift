//
//  CustomMenuHeader.swift
//  ytb_twitterSlider
//
//  Created by pm on 2019/1/13.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit


class CustomMenuHeaderView: UIView {
    
    let kMargin: CGFloat = 16
    let nameLabel = UILabel()
    let usernameLable = UILabel()
    let statsLabel = UILabel()
    let profileLabel = ProfileImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupComponentProps()
        setupStackView()
    }
    
    fileprivate func setupComponentProps() {

        nameLabel.text = "Tang yong zhan"
        usernameLable.text = "516855238@qq.com"
        statsLabel.text = " 41 Following 78321 Followers"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        profileLabel.image = UIImage(named: "girl_profile")
        profileLabel.contentMode = .scaleAspectFit
        profileLabel.layer.cornerRadius = 48 / 2
        profileLabel.layer.masksToBounds = true
        
        setupStatsAttributedText()
    }
    
    fileprivate func setupStatsAttributedText() {
        statsLabel.font = UIFont.systemFont(ofSize: 14)
        let attributedText = NSMutableAttributedString(string: "41 ", attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .medium)])
        attributedText.append(NSMutableAttributedString(string: "Following", attributes: [.foregroundColor: UIColor.black]))
        attributedText.append(NSMutableAttributedString(string: " 78321 ", attributes: [.font : UIFont.systemFont(ofSize: 17, weight: .medium)]))
        attributedText.append(NSMutableAttributedString(string: "Followers", attributes: [.foregroundColor: UIColor.black]))
        statsLabel.attributedText = attributedText
    }
    
    fileprivate func setupStackView(){
        let rightSpacerView = UIView()
        let arrangedSubviews = [
            UIStackView(arrangedSubviews: [profileLabel, rightSpacerView]),
            nameLabel,
            usernameLable,
            SpacerView(space: kMargin),
            statsLabel
        ]
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: kMargin, left: kMargin, bottom: kMargin, right: kMargin)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
