//
//  Retrieve arary into tableview.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 19/04/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class RetrieveAraryIntoTableView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var query = PFQuery(className:"TopTumbler")
     
        query.findObjectsInBackgroundWithBlock({(NSArray objects, NSError error) in
            if (error != nil) {
                println(objects)
            }
            else {
                NSLog("objects %@", objects as NSArray)
     }
        })
        
   
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
