//
//  AgendaViewController.swift
//  AppQuake
//
//  Created by Johan on 08-11-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import UIKit
import FSCalendar
import Firebase

class AgendaViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, UITableViewDelegate, UITableViewDataSource {

    //DEVSCORCH: IBOutlets
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var calendarTableView: UITableView!
    
    //DEVSCORCH: Variables
    
    var agenda = [AgendaPost]()
    
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // FSCalendar General
        
        calendar.scrollDirection = .horizontal
        calendar.scope = .week
        calendar.dataSource = self
        calendar.delegate = self
        calendar.firstWeekday = 2
        calendar.appearance.headerDateFormat = "MMM yy"
        calendar.appearance.borderRadius = 20
        calendar.clipsToBounds = true
        calendar.appearance.todayColor = UIColor.orange
        
        // CalendarTableView Setup
        
        calendarTableView.delegate = self
        calendarTableView.dataSource = self
        
    }
    
    
    // DEVSCORCH: TableView setup
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let agenda = self.agenda[indexPath.row]
        if let cell = calendarTableView.dequeueReusableCell(withIdentifier: "agendaCell") as? AgendaTableViewCell {
            cell.configureCell(agenda: agenda)
            return cell
        } else {
            return AgendaTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agenda.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return -10
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("Date is selected")
        
    }
    
    // DEVSCORCH: Firebase Setup

    func downloadFromFirebase() {
        DataService.instance.REF_AGENDA.observe(.value, with: {(snapshot) in
            print(snapshot.value!)
            self.agenda = []
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    if let agendaDict = snap.value as? Dictionary <String, AnyObject> {
                        _ = snap.key
                        print(self.agenda)

                        if agendaDict["agendaOwner"] as? String == userID {
                            debugPrint(agendaDict)
                            debugPrint(agendaDict["entryName"]!)
                            debugPrint(agendaDict["entryDescription"]!)
                            debugPrint(agendaDict["workedHours"]!)
                            debugPrint(agendaDict["entryDate"]!)
                            
                            let newAgendaEntry = AgendaPost(entryname: agendaDict["entryName"] as! String, entryDescription: agendaDict["entryDescription"] as! String, workedHours: agendaDict["workedHours"] as! String, entryDate: agendaDict["entryDate"] as! String)
                            self.agenda.append(newAgendaEntry)
                    }
                    }
                }
            }
            self.calendarTableView.reloadData()
        })
    }
}
