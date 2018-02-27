//
//  TasksTableviewCell.swift
//  AppQuake
//
//  Created by Johan on 21-02-18.
//  Copyright © 2018 DevScorch. All rights reserved.
//

import UIKit

class TasksTableviewCell: UITableViewCell {

    // DEVSCORCH: @IBOutlets
    
    @IBOutlet weak var tasksLabel: UILabel!
    
    // DEVSCORCH: Variables
    
    var tasks: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    func ConfigureCell() {
        tasksLabel.text = ""
    }
}
