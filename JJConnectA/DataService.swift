//
//  DataService.swift
//  JJConnectA
//
//  Created by MangoyeSidney on 11/27/15.
//  Copyright © 2015 Sidney Mangoye. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    // Create a static instance of the object ds in memory = il ne peut y avoir qu'une seuleinstance de cet objet en memoire et ne peut etre modifie.
    static let ds = DataService()
    
    
    private var _REF_BASE = Firebase(url: "https://jjconnect.firebaseio.com")
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
    
}
