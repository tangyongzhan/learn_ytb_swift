//
//  StretchyHeaderCell.swift
//  ytb_strutchyHeader
//
//  Created by pm on 2019/4/13.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class StretchyHeaderCell: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "shenglin")
        iv.contentMode =  .scaleAspectFill
        return iv
    }()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 28)
        lb.textColor = .white
        return lb
    }()
    
    let descLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 12)
        lb.numberOfLines = 2
        lb.textColor = .white
        return lb
    }()
    
    var animater: UIViewPropertyAnimator?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.fillSuperview()
        setupVisualEffectView()
        setupGradientLayar()
        setupTitleLayout()
    }
    
    fileprivate func setupTitleLayout(){
        titleLabel.text = "Buy more Brian Course "
        descLabel.text = "Let's spend a quick lesson here to see how we can anchor a gradient layer to the top of our UICollectionView Header.  This can appear tricky if you're not used to using anchors and container "
        let statckView = UIStackView(arrangedSubviews: [
                titleLabel,
                descLabel
            ])
        statckView.axis = .vertical
        addSubview(statckView)
        statckView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 16, left: 16, bottom: 16, right: 16), size: .zero)
    }
    
    fileprivate func  setupGradientLayar(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1]
        
        let gradientContainerView = UIView()
        addSubview(gradientContainerView)
        gradientContainerView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        gradientContainerView.layer.addSublayer(gradientLayer)
        print( self.bounds)
        
        gradientLayer.frame = self.bounds
        gradientLayer.frame.origin.y -= self.frame.height
   
    }
    
    func setupVisualEffectView(){
        animater = UIViewPropertyAnimator(duration: 0, curve: .linear) { [weak self] in
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
        }
        animater?.fractionComplete = 0
    }
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
