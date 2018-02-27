//
//  SignUpViewController.swift
//  AppQuake
//
//  Created by Johan Sas on 23-09-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpViewController: UIViewController, UITextFieldDelegate {

    // DEVSCORCH: Variables
    var userEmail: String!
    var firebaseUser: String!
    var userPassword: String!
    var emails = [""]
    
    // DEVSCORCH: IBOutlets
    
    @IBOutlet weak var emailTextField: SignTextField!
    @IBOutlet weak var passwordTextField: SignTextField!
    @IBOutlet weak var reEnterPasswordTextField: SignTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.reEnterPasswordTextField.delegate = self
    }
    
    
    // DEVSCORCH: Functions
    
    
    // TextField functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // Check if the email the user wants to register us already in use or not.
    func checkIfEmailExists(emailTextField: UITextField) {
        DataService.instance.REF_EMAIL.observe(.value, with: {(snapshot) in
            print(snapshot.value!)
            self.emails = []
            
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    if let emailDict = snap.value as? Dictionary<String, AnyObject> {
                        _ = snap.key
                        print(self.emails)
                        if emailDict["email"] as? String == emailTextField.text {
                            debugPrint(emailDict["email"]!)
                            self.showAlertMessage(id: "Error", message: "This email is already in use. Please use another email")
                        } else {
                            self.signUpUser()
                        }
                    }
                }
            }
        })
    }
    
    // This function takes care of signing up the user.
    func signUpUser() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            if passwordTextField.text == reEnterPasswordTextField.text {
                Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                    if let firebaseError = error {
                        print(firebaseError.localizedDescription)
                        self.signUpButtonPressed((Any).self)
                    } else {
                        if let user = user {
                            let userData = ["provider": user.providerID]
                            print(user.email!)
                            self.completeSignUp(id: user.uid, userData: userData)
                            self.postEmailToFirebase()
                            self.signUpButtonPressed((Any).self)
                        }
                    }
                })
            }
        }
    }
    
    // This uploads the emailAdress to the Firebase Database
    func postEmailToFirebase() {
        if emailTextField.text?.isEmpty == true {
            showAlertMessage(id: "Erro", message: "You have to enter a email")
        } else {
            let email: Dictionary<String, AnyObject> = ["email": emailTextField.text as AnyObject]
            let firebaseEmail = DataService.instance.REF_EMAIL.childByAutoId()
            firebaseEmail.setValue(email)
        }
    }
    
    func completeSignUp(id: String, userData: Dictionary<String, String>) {
        DataService.instance.createFireBaseUser(uid: id, userData: userData)
        performSegue(withIdentifier: "showSignInVC", sender: nil)
    }
    
    
    // Alert Message Function
    func showAlertMessage(id: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    
    
    // DEVSCORCH: IBActions
    
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        if emailTextField.text == "", passwordTextField.text == "" {
            showAlertMessage(id: "Error", message: "All TextFields should contain a value")
        } else if passwordTextField.text == "" {
            showAlertMessage(id: "Error", message: "You have to enter a password")
        } else if passwordTextField.text != reEnterPasswordTextField.text {
            showAlertMessage(id: "Error", message: "Both passwords should be identical")
        } else if emailTextField.text == "" {
            showAlertMessage(id: "Error", message: "You have to enter a email")
        } else {
            
            signUpUser()
        }
    }
}
