//
//  DataService.swift
//  JJConnectA
//
//  Created by MangoyeSidney on 11/27/15.
//  Copyright © 2015 Sidney Mangoye. All rights reserved.
//

import Foundation
import Firebase

let URL_BASE = "https://jjconnect.firebaseio.com"


class DataService {
    // Create a static instance of the object ds in memory = il ne peut y avoir qu'une seuleinstance de cet objet en memoire et ne peut etre modifie.
    static let ds = DataService()
    
    
    private var _REF_BASE = Firebase(url: "\(URL_BASE)")
    private var _REF_POSTS = Firebase(url:"\(URL_BASE)/posts")
    private var _REF_USERS = Firebase(url:"\(URL_BASE)/users")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    var REF_POSTS: Firebase {
        return _REF_POSTS
    }
    var REF_USERS: Firebase {
        return _REF_USERS
    }
    
    func createFirebaseUser(uid: String, user: Dictionary<String, String>) {
        // Create the user path if it doesn't exist and set it in "user"
        REF_USERS.childByAppendingPath(uid).setValue(user)
    }
}
