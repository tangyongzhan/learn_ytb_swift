//
//  AppDelegate.swift
//  ytb_autoLayout
//
//  Created by pm on 2019/1/17.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        window?.rootViewController = SwiperController(collectionViewLayout: layout)
        return true
    }

}

