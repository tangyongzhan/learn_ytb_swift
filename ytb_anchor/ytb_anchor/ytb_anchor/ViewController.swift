//
//  ViewController.swift
//  ytb_anchor
//
//  Created by pm on 2018/12/29.
//  Copyright © 2018 pm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let redView = UIView()
        
        let blueView = UIView()
        let greenView = UIView()
        let yellowView = UIView()
        let grayView = UIView()
        let grayView2 = UIView()
        let grayView3 = UIView()
        
        let views = [yellowView,greenView, redView,blueView,grayView,grayView2,grayView3]
        
        views.forEach{ view.addSubview($0) }
        
        yellowView.backgroundColor = .yellow
        yellowView.fillSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
        let redViewW = (UIScreen.main.bounds.width - 4*10)/3
        redView.backgroundColor = .red
        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading:nil , bottom: nil, trailling: view.safeAreaLayoutGuide.trailingAnchor,padding: .init(top: 10, left: 0, bottom: 0, right: 10),size: CGSize(width: redViewW, height: redViewW))
        
        blueView.backgroundColor = .blue
        blueView.anchor(top: redView.bottomAnchor, leading:nil , bottom: nil, trailling: view.trailingAnchor,padding: .init(top: 10, left: 0, bottom: 0, right: 10), size: .zero)
        blueView.anchorSize(to: redView)
        

        greenView.backgroundColor = .green
        greenView.anchor(top: redView.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: blueView.bottomAnchor, trailling: redView.leadingAnchor,padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        
        
        grayView.backgroundColor = .gray
        grayView.anchor(top: greenView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailling: nil, padding: .init(top: 10, left: 10, bottom: 0, right: 0), size: .zero)
        grayView.anchorSize(to: redView)
        
        grayView2.backgroundColor = .gray
        grayView2.anchor(top: greenView.bottomAnchor, leading: grayView.trailingAnchor, bottom: nil, trailling: nil, padding: .init(top: 10, left: 10, bottom: 0, right: 0), size: .zero)
        grayView2.anchorSize(to: redView)
        
        grayView3.backgroundColor = .gray
        grayView3.anchor(top: greenView.bottomAnchor, leading: grayView2.trailingAnchor, bottom: nil, trailling: nil, padding: .init(top: 10, left: 10, bottom: 0, right: 0), size: .zero)
        grayView3.anchorSize(to: redView)
        
    }
    
}

