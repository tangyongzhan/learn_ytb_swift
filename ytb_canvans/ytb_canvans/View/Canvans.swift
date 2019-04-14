//
//  Canvans.swift
//  ytb_canvans
//
//  Created by pm on 2019/4/14.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class Canvans:UIView {
    
    func undo() {
        _ = lines.popLast()
        setNeedsDisplay()
    }
    
    func clear() {
        lines.removeAll()
        setNeedsDisplay()
    }
    
    func setStrokeColor(color: UIColor) {
        strokeColor = color
        setNeedsDisplay()
    }
    
    func setStrokeWidth(width: CGFloat) {
        strokeWidth = width
        setNeedsDisplay()
    }
    
    fileprivate var strokeColor:UIColor = .black
    fileprivate var strokeWidth:CGFloat = 1
    fileprivate var lines = [Line]()

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setLineCap(.round)
        lines.forEach { (line) in
            context.setStrokeColor(line.strokeColor.cgColor)
            context.setLineWidth(line.strokeWidth)
            for (i, p) in line.point.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
            context.strokePath()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(Line.init(strokeColor: strokeColor, strokeWidth: strokeWidth, point: []))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else { return }
        guard var lastLine = lines.popLast() else { return }
        lastLine.point.append(point)
        lines.append(lastLine)
        self.setNeedsDisplay()
    }
}
