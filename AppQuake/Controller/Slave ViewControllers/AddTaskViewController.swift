//
//  AddTaskViewController.swift
//  AppQuake
//
//  Created by Johan on 21-02-18.
//  Copyright © 2018 DevScorch. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    // DEVSCORCH: IBOutlets
    
    @IBOutlet weak var addTaskTextfield: AddAgendaTextFieldUI!
    
    
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
            print(tasksArray)
           
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "AddAgendaEntryViewController")
            vc.viewDidLoad()
            
            
            self.dismiss(animated: true, completion: nil)
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
