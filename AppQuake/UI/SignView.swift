//
//  SignView.swift
//  AppQuake
//
//  Created by Johan Sas on 23-09-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import UIKit

class SignView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 0.5
        layer.cornerRadius = 15
        layer.borderColor = UIColor.gray.cgColor
        layer.shadowRadius = 0
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.2
    }
    
}
