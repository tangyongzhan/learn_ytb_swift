//
//  ViewController.swift
//  ytb_contacts
//
//  Created by pm on 2019/1/4.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit
import Contacts

let cellId = "cellId"
class HomeController: UITableViewController {
    //是否显示显示 indexPath
    var isShowIndexPath = false

    private var contacts = [
        ExpandableNames(isExpand: false,names: [FavouriteableContact(name: "Apple", hasLiked: false)]),
        ExpandableNames(isExpand: false,names: [
            "Bnlan", "Bale", "Bnlanchisle","Bale", "Banasa",
            ].map{ FavouriteableContact(name:$0, hasLiked: false)}),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "showIndexPath", style: .plain, target: self, action: #selector(showContactsDetail))
        
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.95)
        tableView.register(ContactCell.self, forCellReuseIdentifier: cellId)
        
        fetchContacts()
        
    }
    
    private func fetchContacts() {
        //获取授权
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err {
                print("Failed to Request access", err)
                return
            }
            
            if !granted {
                print("Denied")
            } else {
                print("Access")
                // 要获取的信息key列表项
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey,CNContactPhoneNumbersKey]
                // 请求对象
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                
                do {
                    var favouriteableContacts = [FavouriteableContact]()
                    // 发出获取联系人请求
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointerIfYouWantToStopEnumerating) in
                        print(contact.givenName)
                        print(contact.familyName)
                        print(contact.phoneNumbers.first?.value.stringValue ?? "")
                        
                        favouriteableContacts.append(FavouriteableContact(name: contact.givenName, hasLiked: false))
                    })
                    let names = ExpandableNames(isExpand: true, names: favouriteableContacts)
                    self.contacts = [names]
                } catch let err {
                    print("Failed to enumerate contacts:", err)
                }
            }
        }
        
    }
    
    //是否显示详细信息
    @objc func showContactsDetail(){
        var indexPathsToReload  = [IndexPath]()
        for section in contacts.indices {
            for row in contacts[section].names.indices {
                let indexPath = IndexPath(row: row, section: section)
                indexPathsToReload.append(indexPath)
            }
        }
        isShowIndexPath = !isShowIndexPath
        let animate = isShowIndexPath ? UITableView.RowAnimation.left : .right
        tableView.reloadRows(at: indexPathsToReload, with: animate)
    }
    
    //折叠联系人
    @objc func handleExpandClose( button: UIButton ){
        let section = button.tag
        var indexPathToExpand = [IndexPath]()
        for row in contacts[section].names.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPathToExpand.append(indexPath)
        }
        
        let isExpand = contacts[section].isExpand
        // 判断展开属性取反
        contacts[section].isExpand = !isExpand
        button.setTitle(isExpand ? "open" : "colse", for: .normal)
        if !isExpand {
            tableView.insertRows(at: indexPathToExpand, with: .fade)
        } else {
            tableView.deleteRows(at: indexPathToExpand, with: .fade)
        }
    }
    
    // 收藏
    func markSomeOneLike(cell: UITableViewCell){
        guard let indexPathToClickOn = tableView.indexPath(for: cell) else {
            return
        }
        let contact = contacts[indexPathToClickOn.section].names[indexPathToClickOn.row]
        let hasLiked = contact.hasLiked
        contacts[indexPathToClickOn.section].names[indexPathToClickOn.row].hasLiked = !hasLiked
        tableView.reloadRows(at: [indexPathToClickOn], with: .fade)
    }
    
    
    // 设置列表头部
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton(type: .system)
        button.setTitle("open", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        button.tag = section
        return button
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    //设置section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return contacts.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !contacts[section].isExpand {
            return 0
        }
        return contacts[section].names.count
    }
    
    //设置单元格
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ContactCell
        let contact = contacts[indexPath.section].names[indexPath.row]
        var name = contact.name
        if isShowIndexPath {
            name += " section: \(indexPath.section) , row: \(indexPath.row)"
        }
        cell.textLabel?.text = name
        cell.accessoryView?.tintColor = contact.hasLiked ? .red: .lightGray
        cell.links = self
        return cell
    }
    
}

