//
//  PageCell.swift
//  ytb_autoLayout
//
//  Created by pm on 2019/1/17.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    // 页面数据
    var page: Page? {
        didSet{
            guard let unwrapedpage = page  else { return  }
            logoImageView.image = UIImage(named: unwrapedpage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrapedpage.headerText, attributes: [.foregroundColor : UIColor.black, .font: UIFont.systemFont(ofSize: 17, weight: .medium)])
            
            attributedText.append(NSAttributedString(string: "\n\n \(unwrapedpage.bodyText)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, .font: UIFont.systemFont(ofSize: 14, weight: .regular) ]))
            
            descriptionTextLabel.attributedText = attributedText
            descriptionTextLabel.textAlignment = NSTextAlignment.center
        }
    }
    // logo图片
    private let logoImageView:  UIImageView = {
        let iv = UIImageView(image: UIImage(named: "googlelogo"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    // 顶部容器
    private let topViewContainer: UIView = {
        let iv = UIView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // 文字
    private let descriptionTextLabel: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        textView.textAlignment = NSTextAlignment.center
        textView.isUserInteractionEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    fileprivate func setupLayout() {
        addSubview(topViewContainer)
        addSubview(descriptionTextLabel)
        
        topViewContainer.addSubview(logoImageView)
        logoImageView.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: topViewContainer.centerYAnchor).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        NSLayoutConstraint.activate([
            topViewContainer.topAnchor.constraint(equalTo: topAnchor),
            topViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            topViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            topViewContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
            ])
        
        NSLayoutConstraint.activate([
            descriptionTextLabel.topAnchor.constraint(equalTo: topViewContainer.bottomAnchor),
            descriptionTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -16)
            ])
    }
    
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
