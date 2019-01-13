//
//  ExpandableNames.swift
//  ytb_contacts
//
//  Created by pm on 2019/1/4.
//  Copyright © 2019 pm. All rights reserved.
//

import Foundation

struct FavouriteableContact {
    var name: String
    var hasLiked: Bool
}

struct ExpandableNames {
    var isExpand: Bool
    var names: [FavouriteableContact]
}
