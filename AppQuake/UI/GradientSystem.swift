//
//  GradientSystem.swift
//  AppQuake
//
//  Created by Johan Sas on 22-09-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics


typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)

enum Gradientorientation {
    
    case topRightBottomLeft
    case topLeftBottomRight
    case horizontal
    case vertical
    
    var startPoint: CGPoint {
        return points.startPoint
    }
    
    var endPoint: CGPoint {
        return points.endPoint
    }
    
    
    var points: GradientPoints {
        get {
            switch(self) {
            case .topRightBottomLeft:
                return (CGPoint(x: 0.0, y: 1.0), CGPoint(x: 1.0, y: 0.0))
            case .topLeftBottomRight:
                return (CGPoint(x: 0.0, y: 0.0), CGPoint(x: 1.0, y: 0.0))
            case .horizontal:
                return (CGPoint(x: 0.0, y: 0.5), CGPoint(x: 1.0, y: 0.5))
            case .vertical:
                return (CGPoint(x: 0.0, y: 0.0), CGPoint(x: 0.0, y: 1.0))
        }
    }
  }
    
}

extension UIView {
    
    func applyGradient(withColors colors: [UIColor], locations: [NSNumber]? = nil) -> Void {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map {$0.cgColor}
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func applyGradient(withColors colors: [UIColor], gradientOrientation orientation: Gradientorientation) -> Void {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map {$0.cgColor}
        gradient.startPoint = orientation.startPoint
        gradient.endPoint = orientation.endPoint
        self.layer.insertSublayer(gradient, at: 0)
    }
}

