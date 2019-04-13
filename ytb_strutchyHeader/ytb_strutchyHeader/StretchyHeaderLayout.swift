//
//  StretchyHeaderLayout.swift
//  ytb_strutchyHeader
//
//  Created by pm on 2019/4/13.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let  layoutAttributes =  super.layoutAttributesForElements(in: rect)
        layoutAttributes?.forEach({ (attributes) in
            
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
                guard let collectionView = collectionView else { return }
                
                let offsetY = collectionView.contentOffset.y
                if  offsetY > 0 {
                    return
                }
                let width = collectionView.frame.width
                let height = attributes.frame.height - offsetY
                attributes.frame = .init(x: 0, y: offsetY, width: width, height: height)
            }
        })
        
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
