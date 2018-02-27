//
//  AddAgendaEntryViewController.swift
//  AppQuake
//
//  Created by Johan on 20-02-18.
//  Copyright © 2018 DevScorch. All rights reserved.
//

import UIKit



class AddAgendaEntryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    // DEVSCORCH: IBOutlets
    
    @IBOutlet weak var tasksTableView: UITableView!
    @IBOutlet weak var nameLabel: AddAgendaTextFieldUI!
    @IBOutlet weak var workedHoursLabel: AddAgendaTextFieldUI!
    @IBOutlet weak var employerLabel: AddAgendaTextFieldUI!
    
    // DEVSCORCH: Variables
    
    var tasks = tasksArray
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        tasksTableView.reloadData()
    }
    
    // DEVSCORCH: TableView Setup
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if let cell = tasksTableView.dequeueReusableCell(withIdentifier: "tasksCell") as? TasksTableviewCell {
            cell.tasksLabel.text = tasks[indexPath.row] as? String
            return cell
        } else {
            return TasksTableviewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
//    func refreshTableView() {
//
//        let indexPathForSection = NSIndexSet(index: 0)
//        tasksTableView.reloadSections(indexPathForSection as IndexSet, with: UITableViewRowAnimation.middle)
//        tasksTableView.beginUpdates()
//        tasksTableView.insertRows(at: [IndexPath(row: tasks.count-1, section: 0)], with: .automatic)
//
//        tasksTableView.endUpdates()
//
//    }
    
    // DEVSCORCH: IBActions
    @IBAction func addEntryPressed(_ sender: Any) {
        
    }
    
    @IBAction func dismissViewController(_ sender: UIButton) {
        //self.dismiss(animated: true, completion: nil)
        print(tasksArray)
    }
    
    // DAVIDVPE: Segue customization
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openAddTask" {
            //It means that is trying to open the Add Task ViewController
            //I added the identifier to the Main.storyabord
            
            if let addTaskVC = segue.destination as? AddTaskViewController {
                addTaskVC.delegate = self
            }
        }
    }
    
}

extension AddAgendaEntryViewController: AddTaskViewControllerDelegate {
    func didAddNewTask() {
        //Need to reassign the tasksArray value to tasks because they're not pointers but an static copy
        tasks = tasksArray
        tasksTableView.reloadData()
    }
}
