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
        setupNavigationItems()
    }
    
    @objc func handleOpen(){
        (UIApplication.shared.keyWindow?.rootViewController as? BaseslidingController)?.openMenu()
        
    }
    
    @objc func handleHide(){
        (UIApplication.shared.keyWindow?.rootViewController as? BaseslidingController)?.hideMenu()
    }
    
    // 设置导航
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "hide", style: .plain, target: self, action: #selector(handleHide))
        setCircleNavigationButton()
    }
    fileprivate func setCircleNavigationButton(){
        let image = UIImage(named: "girl_profile")?.withRenderingMode(.alwaysOriginal)
        let customView = UIButton(type:.system)
        customView.setImage(image, for: .normal)
        customView.addTarget(self, action: #selector(handleOpen), for: .touchUpInside)
        customView.imageView?.contentMode = .scaleAspectFit
        customView.layer.cornerRadius = 20
        customView.clipsToBounds = true
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customView)
        
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

