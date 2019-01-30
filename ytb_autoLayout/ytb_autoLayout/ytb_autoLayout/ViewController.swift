//
//  ViewController.swift
//  ytb_autoLayout
//
//  Created by pm on 2019/1/17.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // logo图片
    private let logoImageView:  UIImageView = {
        let iv = UIImageView(image: UIImage(named: "googlelogo"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    // 顶部容器
    private let topViewContainer: UIView = {
        let iv = UIView()
        iv.backgroundColor = .white
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // 文字
    private let descriptionTextLabel: UITextView = {
        let textView = UITextView()
        var attributedText = NSMutableAttributedString(string: "Thanks for watching Taiwan Most Popular Songs This Week 2018", attributes: [.foregroundColor : UIColor.black, .font: UIFont.systemFont(ofSize: 17, weight: .medium)])
        
        attributedText.append(NSAttributedString(string: "\n\n A fast, open source web browser engine. WebKit is the web browser engine used by Safari, Mail, App Store, and many other apps on macOS, iOS, and Linux.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, .font: UIFont.systemFont(ofSize: 14, weight: .regular) ]))
    
        textView.attributedText = attributedText
        textView.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        textView.textAlignment = NSTextAlignment.center
        textView.isUserInteractionEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    // 上一步按钮
    private let prevButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("prev", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        return bt
    }()
    
    // 下一步按钮
    private let nextButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("next", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        return bt
    }()
    
    // 分页控制器
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        pageControl.pageIndicatorTintColor = UIColor.gray
        return pageControl
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupPageControl()
    }
    
    
    fileprivate func setupPageControl() {
        let stackView = UIStackView(arrangedSubviews: [prevButton,pageControl,nextButton])
        view.addSubview(stackView)
        
        nextButton.setTitleColor(UIColor.orange, for: .normal)
        
        stackView.backgroundColor = UIColor.red
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    fileprivate func setupLayout() {
        view.addSubview(topViewContainer)
        view.addSubview(descriptionTextLabel)
        
        topViewContainer.addSubview(logoImageView)
        logoImageView.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: topViewContainer.centerYAnchor).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        NSLayoutConstraint.activate([
            topViewContainer.topAnchor.constraint(equalTo: view.topAnchor),
            topViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topViewContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
            ])
        
        NSLayoutConstraint.activate([
            descriptionTextLabel.topAnchor.constraint(equalTo: topViewContainer.bottomAnchor),
            descriptionTextLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
            ])
    }
    
    


}

