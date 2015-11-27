//
//  FeedVC.swift
//  JJConnectA
//
//  Created by MangoyeSidney on 11/27/15.
//  Copyright © 2015 Sidney Mangoye. All rights reserved.
//

import UIKit

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // We must listen the database to know if there is new data available
        // .Value = whenever a data is changed... this is the event we want to listen: anydata, anychildren... it will update the view
        
        DataService.ds.REF_POSTS.observeEventType(.Value, withBlock: { snapshot in
            // This code will be executed only if a data changes
            // This function will "DOWNLOAD THE DATA".. (NO NETWORK STUFFS NEED - The changes are made in REAL TIME)
            print(snapshot.value)
        })
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
        
    }
    
    
}
