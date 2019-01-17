//
//  ProfileController.swift
//  ytb_twitterSlider
//
//  Created by pm on 2019/1/15.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    var textLabel: UILabel  = {
        let label = UILabel()
        label.text = "Profile"
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.frame = view.frame
        view.backgroundColor = .white
        view.addSubview(textLabel)
    }

}
