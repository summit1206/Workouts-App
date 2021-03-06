//
//  GradientView.swift
//  Bloom
//
//  Created by Eric Hodgins on 2016-12-17.
//  Copyright © 2016 Eric Hodgins. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    let gradientLayer = CAGradientLayer()
    @IBInspectable var startColor: UIColor = UIColor.green
    @IBInspectable var endColor: UIColor = UIColor.white
    @IBInspectable var isRounded: Bool = false


    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.cgColor, endColor.cgColor] as CFArray
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations: [CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: colorLocations)!
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: bounds.size.height)
        
        context!.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
        
        if isRounded {
            layer.masksToBounds = true
            layer.cornerRadius = 8.0
        }
    }

}
