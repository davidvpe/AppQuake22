//
//  AddAgendaTextFieldUI.swift
//  AppQuake
//
//  Created by Johan on 21-02-18.
//  Copyright © 2018 DevScorch. All rights reserved.
//

import UIKit

class AddAgendaTextFieldUI: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 15
        layer.masksToBounds = true
        layer.backgroundColor = UIColor.white.cgColor
    }

}
