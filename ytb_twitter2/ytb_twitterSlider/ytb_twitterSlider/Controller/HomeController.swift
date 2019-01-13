//
//  ViewController.swift
//  ytb_twitterSlider
//
//  Created by pm on 2019/1/8.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .red
        setupNavigationItems()
        setupMenuController()
        setupPanGesture()
        setupDarkCoverView()
    }
    
    fileprivate let darkCoverView = UIView()
    fileprivate let menuController = MenuController()
    fileprivate let menuWidth:CGFloat = 300  //侧边导航宽
    fileprivate var isMenuOpend: Bool = false
    fileprivate var velocityOpenThreshold: CGFloat = 500  //速率
    
    @objc func handleOpen(){
        isMenuOpend = true
        performAnimation(transform:  CGAffineTransform(translationX: menuWidth, y: 0))
    }
    
    @objc func handleHide(){
        isMenuOpend = false
        performAnimation(transform: .identity)
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer){
        let translation = gesture.translation(in: view)
        if gesture.state == .changed {
            var x = translation.x
            // 如果是展开的,左拖得负值相加刚好为偏移值
            if isMenuOpend {
                x += menuWidth
            }
            
            x = min(x, menuWidth)
            x = max(0,x)
            let alpha = x/menuWidth
            let transform = CGAffineTransform(translationX: x, y: 0)
            menuController.view.transform = transform
            navigationController?.view.transform = transform
            darkCoverView.transform = transform
            darkCoverView.alpha = alpha
        } else if gesture.state == .ended {
            handleEnded(gesture: gesture)
        }
    }
    // 添加cover层
    fileprivate func setupDarkCoverView(){
        darkCoverView.alpha = 0
        darkCoverView.backgroundColor = UIColor(white: 0, alpha: 0.8)
        darkCoverView.isUserInteractionEnabled = false
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(darkCoverView)
        darkCoverView.frame =  mainWindow?.frame ?? .zero
    }
    
     //添加手势拖动
    fileprivate func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    // 拖动手势结束
    fileprivate func handleEnded(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        if isMenuOpend {
            //如果速率大于500，（滑动快）直接关闭
            if abs(velocity.x) > velocityOpenThreshold {
                handleHide()
                return
            }
            if abs(translation.x) < menuWidth / 2{
                handleOpen()
            } else {
                handleHide()
            }
        } else {
            //如果速率大于500，（滑动快）直接打开
            if velocity.x > velocityOpenThreshold {
                handleOpen()
                return
            }
            if translation.x < menuWidth / 2{
                handleHide()
            } else {
                handleOpen()
            }
        }
    }
    
    // Mark: Fileprivate
    fileprivate func performAnimation(transform: CGAffineTransform){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.menuController.view.transform = transform
            self.navigationController?.view.transform = transform
            self.darkCoverView.transform = transform
            self.darkCoverView.alpha = self.isMenuOpend ? 1 : 0
        })
    }
    
    // 设置侧边栏
    fileprivate func setupMenuController() {
        menuController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: view.frame.height)
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(menuController.view)
        addChild(menuController)
    }
    
    // 设置导航
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "hide", style: .plain, target: self, action: #selector(handleHide))
    }
    
    // 设置内容区Tabelview
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "row \(indexPath.row)"
        cell.backgroundColor = .white
        return cell
    }
    


}

