//
//  ChatRoomMenuController.swift
//  ytb_twitterSlider
//
//  Created by pm on 2019/1/15.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

extension ChatRoomMenuController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filterChatRoomsGroup = chatRoomsGroup
            tableView.reloadData()
            return
        }
        filterChatRoomsGroup = chatRoomsGroup.map { (group) -> [String] in
            print(group.filter{ $0.lowercased().contains(searchText.lowercased())})
            return group.filter{ $0.lowercased().contains(searchText.lowercased())}
        }
        tableView.reloadData()
    }
}

class ChatRoomMenuController: UITableViewController {
    
    fileprivate var chatRoomsGroup = [
        ["Xiao Tom","Tang", "Jian Jian"],
        ["Yong Zhan"],
        ["Stevn Jobs","Tim Cooke","Jack Ma"],
    ]
    fileprivate var filterChatRoomsGroup = [[String]]()
    
    fileprivate class ChatRoomMenuHeader: UILabel {
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.insetBy(dx: 16, dy: 0))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0.2745098039, green: 0.2039215686, blue: 0.2784313725, alpha: 1)
        filterChatRoomsGroup = chatRoomsGroup
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filterChatRoomsGroup.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterChatRoomsGroup[section].count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = ChatRoomMenuHeader()
        let text = section == 0 ? "Unknown" :  section == 1  ? "Unconcerned" : section == 2 ? "Follow" : ""
        label.text = text
        label.textColor = #colorLiteral(red: 0.4450531602, green: 0.3305202127, blue: 0.4591959119, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.2745098039, green: 0.2039215686, blue: 0.2784313725, alpha: 1)
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatMenuItemCell(style: .default, reuseIdentifier: nil)
        let text = filterChatRoomsGroup[indexPath.section][indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        
        let attributedText = NSMutableAttributedString(string: "# ", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.4450531602, green: 0.3305202127, blue: 0.4591959119, alpha: 1), .font: UIFont.systemFont(ofSize: 18, weight: .regular)])
        attributedText.append(NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white]))
        
        cell.textLabel?.attributedText = attributedText
        return cell
    }
}
