//
//  SignInViewController.swift
//  AppQuake
//
//  Created by Johan Sas on 23-09-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import UIKit
import Firebase


class SignInViewController: UIViewController {

    // DEVSCORCH: IBoutlets

    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var emailTextField: SignTextField!
    @IBOutlet weak var passwordTextField: SignTextField!
    
    // DEVSCORCH: Variables

    
    
    // DEVSCORCH: Functions

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // Do any additional setup after loading the view.
    }

    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: {(user, error) in
            if error != nil {
                print("Unable to authenticate with firebase - \(String(describing: error))")
            } else {
                print("Succesfully authenticated with Firebase")
            }
        })
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        if let email = emailTextField.text, let pwd = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: {(user, error) in
                if error == nil {
                    print("Email user has authenticated with Firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.performSegue(withIdentifier: "MainStoryboard", sender: nil)
                    } else {
                        print("Error while authenticating")
                    }
                }
            })
        }
    }
    
    

}
