//
//  ViewController.swift
//  ytb_canvans
//
//  Created by pm on 2019/4/14.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let canvans = Canvans()
    
    let slideValue: Float = 3
    let colors:[UIColor] = [.red, .green, .blue, .yellow, .purple, .orange]
    var colorsButton = [UIButton]()

    
    let undoButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Undo", for: .normal)
        bt.setTitleColor(.blue, for: .normal)
        bt.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return bt
    }()
    
    let clearButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Clear", for: .normal)
        bt.setTitleColor(.blue, for: .normal)
        bt.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return bt
    }()
    
    
    let slider: UISlider = {
        let slider = UISlider()
     
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(handleChangeWidth), for: .valueChanged)
        return slider
    }()
    
    @objc func handleUndo(){
        canvans.undo()
    }
    
    @objc func handleClear(){
        canvans.clear()
    }
    
    @objc func handleChangeColor(sender: UIButton){
        colorsButton.forEach { (button) in
            if button == sender {
                button.layer.borderColor = UIColor.black.cgColor
                button.layer.borderWidth = 2
            } else {
                button.layer.borderColor = UIColor.white.cgColor
                button.layer.borderWidth = 1
            }
        }
        canvans.setStrokeColor(color: sender.backgroundColor ?? .black)
    }
    
    @objc func handleChangeWidth(sender: UISlider){
        canvans.setStrokeWidth(width: CGFloat(sender.value))
    }
    
    override func loadView() {
        self.view = canvans
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContolLayout()
    }
    

    fileprivate func setupColorsButton() {
        colors.forEach { (color) in
            let bt = UIButton(type: .system)
            bt.backgroundColor = color
            bt.layer.borderWidth = 1
            bt.layer.borderColor = UIColor.white.cgColor
            bt.addTarget(self, action: #selector(handleChangeColor), for: .touchUpInside)
            colorsButton.append(bt)
        }
    }
    
    fileprivate func setupContolLayout() {
        
        setupColorsButton()
        
        canvans.backgroundColor = .white
        canvans.setStrokeWidth(width: CGFloat(slideValue))
        slider.setValue(slideValue, animated: true)
        undoButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        let colorStackView = UIStackView(arrangedSubviews: colorsButton)
        colorStackView.distribution = .fillEqually
        
        let statckView = UIStackView(arrangedSubviews: [
            undoButton,
            clearButton,
            colorStackView,
            slider
            ])
        statckView.spacing = 5
        view.addSubview(statckView)
        statckView.translatesAutoresizingMaskIntoConstraints = false
        statckView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        statckView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        statckView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    


}

