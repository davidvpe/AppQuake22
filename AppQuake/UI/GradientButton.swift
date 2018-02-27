//
//  GradientButton.swift
//  AppQuake
//
//  Created by Johan Sas on 22-09-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import UIKit

class GradientButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        layer.masksToBounds = true
       
        
       let color1 = UIColor(red: 63.0/255.0, green: 74.0/255.0, blue: 217.0/255.0, alpha: 1)
       let color2 = UIColor(red: 106/255.0, green: 61.0/255.0, blue: 200.0/255.0, alpha: 1)
       let colors = [color1, color2]
        
        applyGradient(withColors: colors)
    }
}
