//
//  ViewController.swift
//  ytb_phonenumber
//
//  Created by pm on 2019/4/2.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let phoneButtonCellId = "phoneButtonCellId"
    let backButtonCellId = "backButtonCellId"
    
    let headerId = "headerId"
    
    let numbers = [
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "#"
    ]
    
    let lettering = [
        "", "A B C", "D E F", "G H I", "J K L", "M N O", "P Q R S", "T U V", "W X Y Z", "", "+", ""
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(KeyCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(GreenPhoneButtonCell.self, forCellWithReuseIdentifier: phoneButtonCellId)
        collectionView.register(BackButtonCell.self, forCellWithReuseIdentifier: backButtonCellId)
        collectionView.register(DialedNumbersHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
    }
    
    var inputTextDisplayString: String = "1"
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            if indexPath.item == 0 {
                print("call phone")
                return
            } else {
                inputTextDisplayString = String(inputTextDisplayString.dropLast())
            }
        } else {
            inputTextDisplayString += numbers[indexPath.item]
        }
        collectionView.reloadData()
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            if indexPath.item == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: phoneButtonCellId, for: indexPath) as! GreenPhoneButtonCell
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: backButtonCellId, for: indexPath) as! BackButtonCell
                return cell
            }
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! KeyCell
            cell.numberLable.text = numbers[indexPath.item]
            cell.wordLable.text = lettering[indexPath.item]
            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 1 ? 2 : numbers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! DialedNumbersHeader
        header.numbersLabel.text = inputTextDisplayString
        return header
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let height:CGFloat = section == 1 ? 0 : view.frame.height * 0.2
        return .init(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    let leftSpacing: CGFloat = 0.13
    let itemSpacing: CGFloat = 0.1
    lazy var frameWidth: CGFloat = view.frame.width
    lazy var leftPadding: CGFloat = frameWidth * leftSpacing
    lazy var itemPadding: CGFloat = frameWidth * itemSpacing
    lazy var cellWidth = (frameWidth - 2 * leftPadding - 2 * itemPadding) / 3
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return .init(top: 16, left: cellWidth + leftPadding  + itemPadding, bottom: 0, right: leftPadding)
        } else {
            return .init(top: 0, left: leftPadding, bottom: 0, right: leftPadding)
        }
    }
}

