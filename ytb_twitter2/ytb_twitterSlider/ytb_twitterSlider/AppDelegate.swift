//
//  AppDelegate.swift
//  ytb_twitterSlider
//
//  Created by pm on 2019/1/8.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 设置根导航
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = BaseslidingController()
//        window?.rootViewController = UINavigationController(rootViewController: HomeController())
        return true
    }



}

