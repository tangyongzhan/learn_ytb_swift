//
//  BaseslidingController.swift
//  ytb_twitterSlider
//
//  Created by pm on 2019/1/13.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class RightControlerView: UIView {}
class MenuControlerView: UIView {}
class DarkCoverView: UIView {}

class BaseslidingController: UIViewController {
    
    let redView: UIView = {
        let v = RightControlerView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let blueView: UIView = {
        let v = MenuControlerView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let darkCoverView: UIView = {
        let v = DarkCoverView()
        v.alpha = 0
        v.backgroundColor = UIColor(white: 0, alpha: 0.7)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    fileprivate let menuWidth: CGFloat = 300
    fileprivate var redViewLeadingAnchor: NSLayoutConstraint!
    fileprivate var redViewTrailingAnchor: NSLayoutConstraint!
    fileprivate var isMenuOpened = false
    fileprivate let velocityOpenThreshold: CGFloat = 500


    override var preferredStatusBarStyle: UIStatusBarStyle {
        return  isMenuOpened ? UIStatusBarStyle.lightContent: .default;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupPangesture()
    }
    
    fileprivate var rightViewController: UIViewController = UINavigationController(rootViewController: HomeController())
    
    // 选中侧边栏某项
    func didSelectMenuItem(indexPath: IndexPath) {
        performRightViewControllerCleanup()
        hideMenu()
        switch indexPath.row {
        case 0:
            let homeController = HomeController()
            rightViewController = UINavigationController(rootViewController: homeController)
        case 1:
            let listController = ListController()
            rightViewController = UINavigationController(rootViewController: listController)
        case 2:
            let profileController = ProfileController()
            rightViewController = profileController
        default :
            let videoController = VideoController()
            let photoController = PhotoController()
            
            let navController1 = UINavigationController(rootViewController: videoController)
            navController1.tabBarItem.title = "video"
            
            let navController2 = UINavigationController(rootViewController: photoController)
            navController2.tabBarItem.title = "photo"
            
            let tabBarController = UITabBarController()
            tabBarController.viewControllers = [navController1 , navController2]
            rightViewController = tabBarController
        }
        redView.addSubview(rightViewController.view)
        addChild(rightViewController)
    }
    
    func openMenu() {
        redViewLeadingAnchor.constant = menuWidth
        redViewTrailingAnchor.constant = menuWidth
        isMenuOpened = true
        performAnimation()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func hideMenu() {
        redViewLeadingAnchor.constant = 0
        redViewTrailingAnchor.constant = 0
        isMenuOpened = false
        performAnimation()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    fileprivate func setupPangesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapDimiss))
        darkCoverView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTapDimiss() {
        hideMenu()
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        if gesture.state == .changed {
            let translation = gesture.translation(in: view)
            var x = translation.x
            x = isMenuOpened ? x + menuWidth : x
            x = min(x,menuWidth)
            x = max(0, x)
            redViewLeadingAnchor.constant = x
            redViewTrailingAnchor.constant = x
            darkCoverView.alpha = x / menuWidth
        } else if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
    }
    
    // 滑动结束
    fileprivate func handleEnded(gesture: UIPanGestureRecognizer) {
        let translation =  gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        let x = translation.x
        if isMenuOpened {
            if abs(velocity.x) > velocityOpenThreshold {
                hideMenu()
                return
            }
            if abs(x) < menuWidth / 2 {
                openMenu()
            } else {
                hideMenu()
            }
        } else {
            if velocity.x > velocityOpenThreshold {
                openMenu()
                return
            }
            if x < menuWidth / 2 {
                hideMenu()
            } else {
                openMenu()
            }
        }
    }

    
    fileprivate func performRightViewControllerCleanup() {
        rightViewController.view.removeFromSuperview()
        rightViewController.removeFromParent()
    }
    
    fileprivate func performAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.darkCoverView.alpha = self.isMenuOpened ? 1 : 0
            self.view.layoutIfNeeded()
        })
    }
    
    // 设置左右视图
    fileprivate func setupViews() {
        view.addSubview(redView)
        view.addSubview(blueView)
        view.addSubview(darkCoverView)
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor),
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            blueView.topAnchor.constraint(equalTo: view.topAnchor),
            blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor),
            blueView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            blueView.widthAnchor.constraint(equalToConstant: menuWidth),
            
            darkCoverView.topAnchor.constraint(equalTo: redView.topAnchor),
            darkCoverView.trailingAnchor.constraint(equalTo: redView.trailingAnchor),
            darkCoverView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            darkCoverView.leadingAnchor.constraint(equalTo: redView.leadingAnchor)
            
            ])
        redViewLeadingAnchor = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0)
        redViewTrailingAnchor = redView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0)
        redViewLeadingAnchor.isActive = true
        redViewTrailingAnchor.isActive = true
        setupViewControllers()
    }
    
    fileprivate let menuController = ChatRoomMenuContainerController()
    
    // 设置homeController, 和menuController
    fileprivate func setupViewControllers() {
        //let menuController = MenuController()
        //let menuController = ChatRoomMenuController()
        
        let homeView = rightViewController.view!
        let menuView = menuController.view!
        
        homeView.translatesAutoresizingMaskIntoConstraints = false
        menuView.translatesAutoresizingMaskIntoConstraints = false
        
        redView.addSubview(homeView)
        blueView.addSubview(menuView)
        
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: redView.topAnchor),
            homeView.trailingAnchor.constraint(equalTo: redView.trailingAnchor),
            homeView.bottomAnchor.constraint(equalTo: redView.bottomAnchor),
            homeView.leadingAnchor.constraint(equalTo: redView.leadingAnchor),
            
            menuView.topAnchor.constraint(equalTo: blueView.topAnchor),
            menuView.trailingAnchor.constraint(equalTo: blueView.trailingAnchor),
            menuView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor),
            menuView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor)
            ])
        addChild(rightViewController)
        addChild(menuController)
    }
    
}
