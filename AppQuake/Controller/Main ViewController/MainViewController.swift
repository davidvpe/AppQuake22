//
//  MainViewController.swift
//  AppQuake
//
//  Created by Johan on 08-02-18.
//  Copyright © 2018 DevScorch. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // Variables
    
    var agendaViewController: UIViewController!
    var expensesViewController: UIViewController!
    var reportsViewController: UIViewController!
    var profileViewController: UIViewController!
    var selectedIndex: Int = 0
    var viewControllers: [UIViewController]!
    
    // @IBOutlets
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var tabBarView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // let storyboard = UIStoryboard(name: "MainViewVC", bundle: nil)
        
        agendaViewController = storyboard?.instantiateViewController(withIdentifier: "AgendaViewController")
        expensesViewController = storyboard?.instantiateViewController(withIdentifier: "ExpensesViewController")
        reportsViewController = storyboard?.instantiateViewController(withIdentifier: "ReportsViewController")
        profileViewController = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController")
        viewControllers = [agendaViewController, expensesViewController, reportsViewController, profileViewController]
        
        buttons[selectedIndex].isSelected = true
        didButtonPress(buttons[selectedIndex])
        
        
    }

    @IBAction func didButtonPress(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        
        vc.view.frame = mainView.bounds
        mainView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }
 

}
