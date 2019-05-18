//
//  File.swift
//  TemplateFile
//
//  Created by pm on 2019/4/16.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class YTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableBar()
    }
    
    fileprivate func setupTableBar(){
        let redController = UIViewController()
        redController.view.backgroundColor = .red
        let blueController = UIViewController()
        blueController.view.backgroundColor = .blue
        
        viewControllers = [
            templateNavController(title: "red" ,image: "", selectedImage: "", rootViewController: redController),
            templateNavController(title: "blue" ,image: "", selectedImage: "", rootViewController: blueController)
        ]
    }
    
    fileprivate func templateNavController(title: String, image: String, selectedImage: String, rootViewController: UIViewController = UIViewController())-> UINavigationController {
        rootViewController.navigationItem.title = title
        let navController = UINavigationController(rootViewController:rootViewController )
        navController.tabBarItem.image = UIImage(named: image)
        navController.tabBarItem.selectedImage = UIImage(named: selectedImage)
        navController.tabBarItem.title = title
        return navController
    }
    
}
