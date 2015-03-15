//
//  TopTumblersScreen.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 14/03/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class TopTumblersScreen: UIViewController {
    @IBOutlet weak var topTumblerImage: UIImageView!
    @IBOutlet weak var topTumblerTextView: UITextView!
    @IBOutlet weak var topTumblerTitleLabel: UILabel!
    
    var topTumblerTitle = ""
    var topTumblerText = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        //users can't edit the twxt
        topTumblerTextView.editable = false
        
        
        //creating a query which retrive the title string from parse
        var query = PFQuery(className:"TopTumbler")
        query.getObjectInBackgroundWithId("KZKxYp9aWz") {
            (toptumblerstring: PFObject!, error: NSError!) -> Void in
            if error == nil && toptumblerstring != nil {
                
                println(toptumblerstring["toptumblerstring"] as String)
                self.topTumblerTitle = toptumblerstring["toptumblerstring"] as String
                println(self.topTumblerTitle)
                self.topTumblerTitleLabel.text = String(self.topTumblerTitle)
            } else {
                println(error)
            }
        }
    }
    
    //creating a query which retrive the text string from parse
    var querytext = PFQuery(className:"TopTumbler")
    querytext.getObjectInBackgroundWithId("GoDJdDBTr4") {
    (toptumblerstring: PFObject!, error: NSError!) -> Void in
    if error == nil && toptumblerstring != nil {
    
    println(toptumblerstring["toptumblerstring"] as String)
    self.topTumblerText = toptumblerstring["toptumblerstring"] as String
    println(self.topTumblerText)
    self.topTumblerTextView.text = String(self.topTumblerText)
    } else {
    println(error)
    }
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
