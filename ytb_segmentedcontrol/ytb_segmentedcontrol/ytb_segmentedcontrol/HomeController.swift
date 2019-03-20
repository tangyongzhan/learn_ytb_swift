//
//  ViewController.swift
//  ytb_segmentedcontrol
//
//  Created by pm on 2019/3/20.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private let cellId = "cellId"
    lazy var  segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Games", "Movies", "Books"])
        sc.addTarget(self, action: #selector(handlerTapSegmented), for: .valueChanged)
        return sc
    }()
    
    let tableView = UITableView()
    let games = ["Game1", "Game2", "Game3", "Game4"]
    let movies = ["Movie1", "Movie2", "Movie3", "Movie4"]
    let books = ["Book1", "Book2", "Book3", "Book4"]
    
    lazy var toDisplayData:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "HomeController"
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = .white
        
        let paddingStackView = UIStackView(arrangedSubviews: [segmentedControl])
        paddingStackView.layoutMargins = .init(top: 12, left: 12, bottom: 6, right: 12)
        paddingStackView.isLayoutMarginsRelativeArrangement = true
    
        let statckView = UIStackView(arrangedSubviews: [paddingStackView, tableView])
        view.addSubview(statckView)
        statckView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
        statckView.axis = .vertical

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        segmentedControl.selectedSegmentIndex = 0
        
        
        tableView.anchor(top: nil, leading: statckView.leadingAnchor, bottom: statckView.bottomAnchor, trailing: statckView.trailingAnchor, padding: .zero)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        toDisplayData = games
        
    }
    
    @objc func handlerTapSegmented(){
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            toDisplayData = games
        case 1:
            toDisplayData = movies
        default:
            toDisplayData = books
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDisplayData.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = toDisplayData[indexPath.row]
        return cell
    }
    

}

