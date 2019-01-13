//
//  ChatMessageCell.swift
//  ytb_message
//
//  Created by pm on 2019/1/2.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    // 文字标签和容器
    let messageLabel = UILabel()
    let bubleBackgroundView = UIView()
    
    // 消息
    var chatMessage: ChatMessage!  {
        didSet {
            bubleBackgroundView.backgroundColor = chatMessage.incomming ? .white :  .darkGray
            messageLabel.text = chatMessage.text
            messageLabel.textColor = chatMessage.incomming ? .black :  .white
            
            
            let leadingAnchorConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
            let trailingAnchorConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
            if chatMessage.incomming {
                leadingAnchorConstraint.isActive = false
                trailingAnchorConstraint.isActive = true
            } else {
                leadingAnchorConstraint.isActive = true
                trailingAnchorConstraint.isActive = false
            }
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        // 设置标签
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
      
        addSubview(bubleBackgroundView)
        addSubview(messageLabel)
        
        
        bubleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        bubleBackgroundView.layer.cornerRadius = 12
        bubleBackgroundView.backgroundColor = .white
        
        // 设置label的布局
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let anchorsConstraints = [ messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                                   messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
                                   messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
                                   
                                   bubleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
                                   bubleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor,constant: -16),
                                   bubleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
                                   bubleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)
            ]

        NSLayoutConstraint.activate(anchorsConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
