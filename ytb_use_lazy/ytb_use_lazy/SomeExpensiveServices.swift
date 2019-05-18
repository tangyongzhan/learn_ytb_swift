//
//  SomeExpensiveServices.swift
//  ytb_use_lazy
//
//  Created by pm on 2019/5/2.
//  Copyright © 2019 pm. All rights reserved.
//

import Foundation


class SomeExpensiveServices {
    static func calcNumber() -> Int {
        var number = 0
        for i in 1...1500000{
            print(i)
            number = i
        }
        return number
    }
}
