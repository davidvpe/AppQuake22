//
//  AddTaskViewController.swift
//  AppQuake
//
//  Created by Johan on 21-02-18.
//  Copyright © 2018 DevScorch. All rights reserved.
//

import UIKit

protocol AddTaskViewControllerDelegate: class {
    func didAddNewTask()
}

class AddTaskViewController: UIViewController {

    // DEVSCORCH: IBOutlets
    
    @IBOutlet weak var addTaskTextfield: AddAgendaTextFieldUI!
    
    weak var delegate: AddTaskViewControllerDelegate? = nil
    
    // DEVSCORCH: Variables
    
    var tasks = tasksArray
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    // TableView refresh
    
   
   
    @IBAction func addTaskPressed(_ sender: Any) {
        let newTask = addTaskTextfield.text!
        if newTask == "" {
            showAlertMessage("Oops", message: "The textfield should contain a value. Please try again")
        } else {
            tasksArray.append(newTask)
            self.dismiss(animated: true, completion: {
                self.delegate?.didAddNewTask()
            })
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Instantiation Function
    
   
    
    // DEVSCORCH: ErrorHandling
    
    func showAlertMessage(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    

}
