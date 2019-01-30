//
//  NewsController.swift
//  ytb_SwipingPageProject
//
//  Created by pm on 2019/1/30.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class NewsController: UITableViewController {
    private let cellId = "cellId"
    let items = [
        "Uncomment the following line to preserve selection between presentations",
        "Uncomment the following line to display an Edit button in the navigation bar for this view controller",
        "Available. Unbiased global news. Social justice news. Truly international news. 40+ language translations. Types: Politics, Arts & Culture, Human Rights, Science, Breaking News, Economics & Business, Food, Travel, Religion, Education.",
        "Multilingual Newsroom Team Reports Available. Unbiased global news. Social justice news. Truly international news. 40+ language translations. Types: Politics, Arts & Culture, Human Rights, Science, Breaking News, Economics & Business, Food, Travel, Religion, Education.",
        "Uncomment the following line to preserve selection between presentations",
        "the following line to display an Edit button in the navigation bar for this view controller",
        "Social justice news. Truly international news. 40+ language translations. Types: Politics, Arts & Culture, Human Rights, Science, Breaking News, Economics & Business, Food, Travel, Religion, Education.",
        "Multilingual Newsroom Team Reports Available. Unbiased global news. Social justice news. Truly international news. 40+ language translations. Types: Politics, Arts & Culture, Human Rights, Science, Breaking News, Economics & Business, Food, Travel, Religion, Education.",
        "Uncomment the following line to preserve selection between presentations",
        "the following line to display an Edit button in the navigation bar for this view controller",
        "Global news. Social justice news. Truly international news. 40+ language translations. Types: Politics, Arts & Culture, Human Rights, Science, Breaking News, Economics & Business, Food, Travel, Religion, Education.",
        "Politics, Arts & Culture, Human Rights, Science, Breaking News, Economics & Business, Food, Travel, Religion, Education.",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets.init(top: 16, left: 0, bottom: 0, right: 0)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.numberOfLines = 0 
        return cell
    }
    
}


