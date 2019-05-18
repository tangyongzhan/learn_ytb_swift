//
//  ViewController.swift
//  ytb_use_lazy
//
//  Created by pm on 2019/5/2.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label: UILabel = {
        let l = UILabel()
        l.text = "welcom"
        l.font = UIFont.systemFont(ofSize: 30)
        l.numberOfLines = 3
        l.textAlignment = .center
        return l
    }()
    

    let normalButtn: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("normal button", for: .normal)
        bt.backgroundColor = .darkGray
        bt.tintColor = .white
        return bt
    }()
    
    let expensiveButtn: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("expensive button", for: .normal)
        bt.tintColor = .white
        bt.backgroundColor = UIColor.purple
        return bt
    }()
    
    let sapcingView: UIView = {
        let v = UIView()
        return v
    }()
    
    
    // 为什么使用 lazy
//     let number = SomeExpensiveServices.calcNumber()
    lazy var number = SomeExpensiveServices.calcNumber()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewLayout()
        
        normalButtn.addTarget(self, action: #selector(handleNormal), for: .touchUpInside)
        expensiveButtn.addTarget(self, action: #selector(handleExpensive), for: .touchUpInside)
        print("view did loaded")
    }
    
    @objc func handleNormal(){
        print("normal click")
    }
    
    @objc func handleExpensive(){
        print("expensive click")
        label.text = "Your number is \(number)"
    }
    
    fileprivate func setupViewLayout() {
        let statckView = UIStackView(arrangedSubviews: [
            label,
            normalButtn,
            expensiveButtn,
            sapcingView,
            ])
        statckView.axis = .vertical
        statckView.spacing = 16
        view.addSubview(statckView)
        
        statckView.translatesAutoresizingMaskIntoConstraints = false
        statckView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        statckView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        statckView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        statckView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        
        sapcingView.translatesAutoresizingMaskIntoConstraints = false;
        sapcingView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        normalButtn.translatesAutoresizingMaskIntoConstraints = false;
        normalButtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        expensiveButtn.translatesAutoresizingMaskIntoConstraints = false;
        expensiveButtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }


}

