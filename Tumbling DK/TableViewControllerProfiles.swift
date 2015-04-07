//
//  TableViewControllerProfiles.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 04/04/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class TableViewControllerProfiles: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //numbers of titles in the array is equal to the rows in the tableview
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //initialize the cell
        let cell: CustomCellThird = tableView.dequeueReusableCellWithIdentifier("Cell") as CustomCellThird
        cell.setCell()
        
        return cell
    }

}
