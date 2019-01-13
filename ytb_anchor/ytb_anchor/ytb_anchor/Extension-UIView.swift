//
//  Extensen-UIView.swift
//  ytb_anchor
//
//  Created by pm on 2018/12/30.
//  Copyright © 2018 pm. All rights reserved.
//

import UIKit

struct AnchorConstraints {
    var top,leading,bottom,trailling,width,height: NSLayoutConstraint?;
}

extension UIView {
    // 适应superview
    func fillSuperview(padding: UIEdgeInsets = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor{
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor{
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor{
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor{
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    // 与另一个view相等
    func anchorSize(to view: UIView){
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    //自定义锚点，间距，宽高
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailling: NSLayoutXAxisAnchor?,padding:UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchorConstraints{
        
        //常量布局
        translatesAutoresizingMaskIntoConstraints = false
        var anchorConstraints = AnchorConstraints()
        if let top = top {
            anchorConstraints.top = topAnchor.constraint(equalTo: top, constant:padding.top )
        }
        
        if let leading = leading {
            anchorConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchorConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailling = trailling {
            anchorConstraints.trailling = trailingAnchor.constraint(equalTo: trailling, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchorConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchorConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
    [anchorConstraints.top,anchorConstraints.leading,anchorConstraints.bottom,anchorConstraints.trailling,anchorConstraints.width,anchorConstraints.height].forEach { $0?.isActive = true }
        return anchorConstraints
        
    }
}


