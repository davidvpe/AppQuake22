//
//  AuthService.swift
//  AppQuake
//
//  Created by Johan on 03-10-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ _status: Bool, _ _error: Error?) ->()) {
        
    
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreationComplete(false, error)
                return
            }
            let userData = ["provider": user.providerID, "email": user.email]
            DataService.instance.createFireBaseUser(uid: user.uid, userData: userData as! Dictionary<String, String> )
            userCreationComplete(true, nil)
        }
        
    
    }
    
    
    func loginUser(withEmail email: String, andPassword password: String, userLoginComplete: @escaping (_ _status: Bool, _ _error: Error?) ->()) {
        
        Auth.auth().signIn(withEmail: email, password: password) {(user, error) in
           
            if error != nil{
                userLoginComplete(false, error)
                return
            }
            userLoginComplete(true, nil)
            
        }
    }
}
