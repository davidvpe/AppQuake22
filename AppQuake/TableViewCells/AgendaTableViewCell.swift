//
//  AgendaTableViewCell.swift
//  AppQuake
//
//  Created by Johan on 15-02-18.
//  Copyright © 2018 DevScorch. All rights reserved.
//

import UIKit

class AgendaTableViewCell: UITableViewCell {

    //@IBOutlets
    
    @IBOutlet weak var entryDescriptionLabel: UILabel!
    @IBOutlet weak var workedHoursLabel: UILabel!
    @IBOutlet weak var entryNameLabel: UILabel!
    var entryDate: String!

    // Variables
    
    var agenda: AgendaPost!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(agenda: AgendaPost) {
        self.agenda = agenda
        self.entryNameLabel.text = agenda.entryName
        self.entryDescriptionLabel.text = agenda.entryDescription
        self.workedHoursLabel.text = agenda.workedHours
        self.entryDate = agenda.entryDate
    }
    

}
