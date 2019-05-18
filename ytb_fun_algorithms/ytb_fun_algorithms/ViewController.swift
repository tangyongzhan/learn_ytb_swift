//
//  ViewController.swift
//  ytb_fun_algorithms
//
//  Created by pm on 2019/4/27.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var temp = [1,2,3,5,7,9,10,15,18,19,20,28,30]

    override func viewDidLoad() {
        super.viewDidLoad()
       
//        testBinarySearch()
//        let number = recursion(value: 5)
//        print(number)
        
    }
    
    // 测试二叉树搜索
    func testBinarySearch(){
        var hundred = [Int]()
        for index in 1...100 {
            hundred.append(index)
        }
        let isExist = binarySearch(searchValue: 99, in: hundred)
        print(isExist)
    }
    
    // 二叉树搜索
    func binarySearch(searchValue: Int, in data : [Int] ) -> Bool {
        var leftIndex = 0
        var rightIndex = data.count - 1
        while leftIndex <= rightIndex {
            let middleIndex = (leftIndex + rightIndex) / 2
            let middelValue = data[middleIndex]
            print("middelValue: \(middelValue) , leftIndex: \(leftIndex) , rightIndex: \(rightIndex),array: [\(data[leftIndex]), \(data[rightIndex])] ")
            if searchValue == middelValue {
                return true
            }
            
            if searchValue < middelValue {
                rightIndex = middleIndex - 1
            }
            
            if searchValue > middelValue {
                leftIndex = middleIndex + 1
            }
        }
        return false
    }
    
    
    // 递归阶乘
    func recursion(value: UInt) -> UInt {
        if value == 0 {
            return 1
        }
        print(value)
        return value * recursion(value: value - 1)
    }


}

