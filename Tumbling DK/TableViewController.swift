//
//  TableViewController.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 04/04/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

var g_arrayOfObjectIdStrings : [String] = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
var g_i : Int = 0


class TableViewController: PFQueryTableViewController {
    
    
    override func viewDidLoad() {
        
    }
    
    // Initialise the PFQueryTable tableview
    override init!(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "TopTumbler"
        self.textKey = "toptumblertitle"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery! {
        var query = PFQuery(className: "TopTumbler")
        query.orderByAscending("createdAt")
        return query
    }
    
    

    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject) -> PFTableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! CustomCellSec!
        if cell == nil {
            cell = CustomCellSec(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if object["toptumblertitle"] != nil{
            println("OBJECTIDS   \(object.objectId)")
            println(object["toptumblertitle"])
            cell.rowsOfTopTumblere.text = object["toptumblertitle"] as! String!
            }
        
        g_arrayOfObjectIdStrings[g_i++] = object.objectId
        //g_arrayOfObjectIdStrings[1] = "Hej1"
        //g_arrayOfObjectIdStrings[2] = "Hej2"

        return cell

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var topTumblersScreen: TopTumblersScreen = self.storyboard?.instantiateViewControllerWithIdentifier("TopTumblersScreen") as! TopTumblersScreen
        self.presentViewController(topTumblersScreen, animated: true, completion: nil)
        

        }
    }




