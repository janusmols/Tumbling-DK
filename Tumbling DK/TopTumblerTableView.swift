//
//  TopTumblerTableView.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 20/04/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class TopTumblerTableView: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //numbers of titles in the array is equal to the rows in the tableview
        return 10
    }
   
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //initialize the cell
        let cell: CustomCellSec = tableView.dequeueReusableCellWithIdentifier("Cell") as! CustomCellSec
        
        var query = PFQuery(className:"TopTumbler")
        query.whereKey("toptumblertitle", equalTo: String())
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                
              var name = objects
             println(objects)
                cell.rowsOfTopTumblere.text  = "\(name)" as String
            }
        }

        
        return cell
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
