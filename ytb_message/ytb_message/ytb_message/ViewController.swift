//
//  ViewController.swift
//  ytb_message
//
//  Created by pm on 2019/1/2.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

struct ChatMessage {
    var text: String
    var incomming: Bool
    var date: Date
}

extension Date {
    static func dateFromCustomeString(customString: String) -> Date {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "YYYY/MM/dd"
        return dateFormater.date(from: customString) ?? Date()
    }
}

class ViewController: UITableViewController {
    
    private var cellId = "cellId"
    
    private var chatMessages = [[ChatMessage]]()
    
    let messageFormServer = [
        ChatMessage(text: "breaking constraint ", incomming: true, date: Date.dateFromCustomeString(customString: "2018-12-11")),
        ChatMessage(text: "look at each constraint and try to figure out which you don't", incomming: true,date: Date.dateFromCustomeString(customString: "2018-12-11")),
         ChatMessage(text: "Probably at least one of the constraints in the following list is one you don't want. ", incomming: true,date:  Date.dateFromCustomeString(customString: "2018-12-09")),
        ChatMessage(text: "Unable to simultaneously satisfy constraints.Probably at least one of the constraints in the following list is one you don't want. ", incomming: false,date:  Date.dateFromCustomeString(customString: "2018-12-11")),
        ChatMessage(text: "which you don't ", incomming: true,date:  Date.dateFromCustomeString(customString: "2018-12-11")),
        ChatMessage(text: " one of the constraints in the  ", incomming: false,date: Date.dateFromCustomeString(customString: "2018-12-20")),
        ChatMessage(text: "find the code that added the unwanted constraint or constraints and fix it.", incomming: true,date: Date.dateFromCustomeString(customString: "2018-12-20"))
    ]

    override func viewDidLoad() {
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        
        attemptToAssembleGroupeMessages()
    }
    
    //将数据按date分组
    fileprivate func attemptToAssembleGroupeMessages(){
        let groupMessages = Dictionary(grouping: messageFormServer) { (element) -> Date in
            return element.date
        }
        // 日期排序
        let sortedKeys = groupMessages.keys.sorted()
        // 日期分组消息
        sortedKeys.forEach { (key) in
            let values = groupMessages[key]
            chatMessages.append(values ?? [])
        }
    }
    
    //section数量
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    //单元格数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    //单元格
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        cell.chatMessage = chatMessages[indexPath.section][indexPath.row]
        return cell
    }
    
    //section头部
    /*
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let firstMessageInSection = chatMessages[section].first {
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "YYYY/MM/dd"
            let dateString = dateFormater.string(from: firstMessageInSection.date)
            return "\(dateString)"
        }
        return "\(Date())"
    }
    */
    
    // 自定义头部label
    class DateHeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame:frame)
            backgroundColor = .black
            font = UIFont.boldSystemFont(ofSize: 14)
            textColor = .white
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        //设置label内容宽高
        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalContentSize.width + 16, height: height)
        }
    }
    
    // 用自定义view作头部
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = chatMessages[section].first {
            // 设置文字
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "YYYY/MM/dd"
            let dateString = dateFormater.string(from: firstMessageInSection.date)
            let label = DateHeaderLabel()
            label.text = dateString
   
            // 设置居中
            let containerView = UIView()
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            return containerView
            
        }
        return nil
    }
    
    //是指头部
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

}

