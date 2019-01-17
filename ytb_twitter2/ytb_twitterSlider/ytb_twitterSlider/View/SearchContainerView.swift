//
//  SearchContainerView.swift
//  ytb_twitterSlider
//
//  Created by pm on 2019/1/16.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class SearchContainerView: UIView {

    let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.searchBarStyle = .minimal
        sb.placeholder = "Enter Some text"
        return sb
    }()
    
    let roketImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "rocket")
        iv.layer.cornerRadius = 3
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.2470588235, green: 0.1882352941, blue: 0.2509803922, alpha: 1)
        setupSearchIcon()
        setupSearchBar()
        
    }
    
    fileprivate func setupSearchIcon() {
        addSubview(roketImageView)
        roketImageView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 12, bottom: 12, right: 0), size: CGSize(width: 40, height: 40))
    }
    
    fileprivate func setupSearchBar() {
        addSubview(searchBar)
        searchBar.anchor(top: nil, leading: roketImageView.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 4, right: 0))
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
