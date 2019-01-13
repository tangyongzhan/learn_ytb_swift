//
//  AppDelegate.swift
//  ytb_message
//
//  Created by pm on 2019/1/2.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        return true
    }

  


}

