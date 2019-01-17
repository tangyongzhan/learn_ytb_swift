//
//  ChatRoomMenuContainerController.swift
//  ytb_twitterSlider
//
//  Created by pm on 2019/1/16.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class ChatRoomMenuContainerController: UIViewController {
    let searchContainer = SearchContainerView()
    let chatRoomMenuController = ChatRoomMenuController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  #colorLiteral(red: 0.2745098039, green: 0.2039215686, blue: 0.2784313725, alpha: 1)
        let chatRoomsView = chatRoomMenuController.view!
        view.addSubview(chatRoomsView)
        view.addSubview(searchContainer)
        
        searchContainer.searchBar.delegate = chatRoomMenuController
        
        searchContainer.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        searchContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64).isActive = true
        
        chatRoomsView.anchor(top: searchContainer.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero, size: .zero)
    }
}
