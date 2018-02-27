//
//  SignTextField.swift
//  AppQuake
//
//  Created by Johan Sas on 23-09-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import UIKit

class SignTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 0.5
        layer.cornerRadius = 5
        layer.borderColor = UIColor.gray.cgColor
        layer.shadowRadius = 0
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.0
        
    }

}
