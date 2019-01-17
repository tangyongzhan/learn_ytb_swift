//
//  SpacerView.swift
//  ytb_twitterSlider
//
//  Created by pm on 2019/1/13.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class SpacerView: UIView {
    let space: CGFloat
    override var intrinsicContentSize: CGSize {
        return CGSize(width: space, height: space)
    }
    
    init(space: CGFloat = 0) {
        self.space = space
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
