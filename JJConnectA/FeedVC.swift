//
//  FeedVC.swift
//  JJConnectA
//
//  Created by MangoyeSidney on 11/27/15.
//  Copyright © 2015 Sidney Mangoye. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var posts = [Post]()
    
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
            self.posts = []

            // Here we will parse the data retrieved - get all the snapshot array as FDataSnapshot
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                for snap in snapshots {
                    print("SNAP: \(snap)")
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let post = Post(postKey: key, dictionary: postDict)
                        self.posts.append(post)
                        
                    }
                }
            }
            
            
            self.tableView.reloadData()
        })
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        print(post.postDescription)
        
        return tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
        
    }
    
    
}
