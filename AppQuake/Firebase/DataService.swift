//
//  DataService.swift
//  AppQuake
//
//  Created by Johan on 30-09-17.
//  Copyright © 2017 DevScorch. All rights reserved.
//

import Foundation
import Firebase


// Protocols

protocol DataServiceDelegate: class {
    func dataloaded()
}

// Variables

let DB_BASE = Database.database().reference()

class DataService {
    
    
    // Variables
    
    static let instance = DataService()
    let ref = Database.database().reference()
    weak var delegate: DataServiceDelegate?
    
    // Database variables
    
    private var _REF_BASE = DB_BASE
    private var _REF_USER = DB_BASE.child("users")
    private var _REF_EMAIL = DB_BASE.child("email")
    
    // User Variables
    
    private var _REF_AGENDA = DB_BASE.child("agenda")
    private var _REF_EXPENSE = DB_BASE.child("expenses")
    private var _REF_REPORTS = DB_BASE.child("reports")
    private var _REF_PROFILE = DB_BASE.child("profile")
    
    // DataService Setup
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USER: DatabaseReference {
        return _REF_USER
    }
    
    var REF_AGENDA: DatabaseReference {
        return _REF_AGENDA
    }
    
    var REF_EXPENSE: DatabaseReference {
        return _REF_EXPENSE
    }
    
    var REF_REPORTS: DatabaseReference {
        return _REF_REPORTS
    }
    
    var REF_PROFILE: DatabaseReference {
        return _REF_PROFILE
    }
    
    var REF_EMAIL: DatabaseReference {
        return _REF_EMAIL
    }
    
    // Create User Function
    
    func createFireBaseUser(uid: String, userData: Dictionary<String, String>) {
        REF_USER.child(uid).updateChildValues(userData)
    }
}

