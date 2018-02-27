//
//  AgendaPost.swift
//  AppQuake
//
//  Created by Johan on 15-02-18.
//  Copyright © 2018 DevScorch. All rights reserved.
//

import Foundation

class AgendaPost {
    
    private var _entryName: String!
    private var _entryDescription: String!
    private var _entryDate: String!
    private var _workedHours: String!
    private var _employer: String!
    private var _billable: String!
    private var _agendaOwner: String! = userID
    private var _agendaKey: String!
    
    
    var entryName: String {
        return _entryName
    }
    
    var entryDescription: String {
        return _entryDescription
    }
    
    var workedHours: String {
        return _workedHours
    }
    
    var employer: String {
        return _employer
    }
    
    var billable: String {
        return _billable
    }
    
    var agendaOwner: String {
        return _agendaOwner
    }
    
    var agendaKey: String {
        return _agendaKey
    }
    
    var entryDate: String {
        return _entryDate
    }
    
    
    init(entryname: String, entryDescription: String, workedHours: String, entryDate: String) {
        self._entryName = entryname
        self._entryDescription = entryDescription
        self._workedHours = workedHours
        self._employer = employer
        self._billable = billable
        self._agendaOwner = agendaOwner
        self._entryDate = entryDate
    }
    
    init(agendaPost: String, agendaData: Dictionary<String, AnyObject>) {
        self._agendaKey = agendaKey
        
        if let entryName = agendaData["entryName"] as? String {
            self._entryName = entryName
        }
        
        if let entryDescription = agendaData["entryDescription"] as? String {
            self._entryDescription = entryDescription
        }
        
        if let workedHours = agendaData["workedHours"] as? String {
            self._workedHours = workedHours
        }
        
        if let employer = agendaData["employer"] as? String {
            self._employer = employer
        }
        
        if let billable = agendaData["billable"] as? String {
            self._billable = billable
        }
        
        if let agendaOwner = agendaData["agendaOwner"] as? String {
            self._agendaOwner = agendaOwner
        }
        
        if let entryDate = agendaData["entryDate"] as? String {
            self._entryDate = entryDate
        }
    }
}
