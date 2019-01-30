//
//  SwiperController+Extension.swift
//  ytb_autoLayout
//
//  Created by pm on 2019/1/17.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

extension SwiperController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }, completion: nil)
    }
}
