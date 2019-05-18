//
//  ViewController.swift
//  ytb_Hyperlinks
//
//  Created by pm on 2019/5/2.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

extension NSAttributedString {
    //超链接方法
    static func makeHyperlink(for path: String, in string: String, as substring: String) -> NSAttributedString{
        let nsString = NSString(string: string)
        let substringRang = nsString.range(of: substring)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.link, value: path, range: substringRang)
        return attributedString
    }
}

class ViewController: UIViewController {
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "Click here learn How to creating Hyperlinks | Swift 5, Xcode 10"
        tv.isEditable = false
        tv.isSelectable = true
        return tv
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        textView.heightAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        textView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        updateTextView()
        
    }
    
    fileprivate func updateTextView(){
        let string = textView.text ?? ""
        let path = "https://www.youtube.com/watch?v=cxFi4rO11uk"
        let attributedText = NSAttributedString.makeHyperlink(for: path, in: string, as: "here")
        textView.attributedText = attributedText
        textView.font = UIFont.systemFont(ofSize: 30)
        textView.textColor = .black
        textView.textAlignment = .center
    }
}

