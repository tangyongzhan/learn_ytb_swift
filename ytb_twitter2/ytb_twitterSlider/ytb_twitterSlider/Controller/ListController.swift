//
//  ListController.swift
//  ytb_twitterSlider
//
//  Created by pm on 2019/1/15.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class ListController: UITableViewController {
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Lists"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)!
        cell.textLabel?.text = "List Row:\( indexPath.row )"
        return cell
    }
    
}
