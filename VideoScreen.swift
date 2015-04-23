//
//  VideoScreen.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 14/03/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class VideoScreen: PFQueryTableViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    override func viewDidLoad() {
        
    }
    
    
    // Initialise the PFQueryTable tableview
    
    override init!(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "Video"
        self.textKey = "videoURL"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery! {
        var query = PFQuery(className: "Video")
        query.orderByAscending("videoURL")
        return query
    }
    
 
    
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject) -> PFTableViewCell {
        //Oneshoot
        var g_oneshoot = false
        let cell: VideoCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! VideoCell
        
        // Extract values from the PFObject to display in the table cell
        if object["videoURL"] != nil {
            println(object["videoURL"])
            var url = object["videoURL"] as! String
            cell.setCell(url)
            g_oneshoot = true
            
        }
        

        return cell
        
    }
}

