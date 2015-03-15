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
    var toptumblerPersonImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        //users can't edit the twxt
        topTumblerTextView.editable = false
        
        
        //creating a query which retrive the title string from parse
        var query = PFQuery(className:"TopTumbler")
        query.getObjectInBackgroundWithId("KZKxYp9aWz") {
            (toptumblertitle: PFObject!, error: NSError!) -> Void in
            if error == nil && toptumblertitle != nil {
                
                println(toptumblertitle["toptumblertitle"] as String)
                self.topTumblerTitle = toptumblertitle["toptumblertitle"] as String
                println(self.topTumblerTitle)
                self.topTumblerTitleLabel.text = String(self.topTumblerTitle)
            } else {
                println(error)
            }
        }
        
        //creating a query which retrive the text string from parse
        var querytext = PFQuery(className:"TopTumbler")
        querytext.getObjectInBackgroundWithId("KZKxYp9aWz") {
            (toptumblertext: PFObject!, error: NSError!) -> Void in
            if error == nil && toptumblertext != nil {
                
                println(toptumblertext["toptumblertext"] as String)
                self.topTumblerText = toptumblertext["toptumblertext"] as String
                println(self.topTumblerText)
                self.topTumblerTextView.text = String(self.topTumblerText)
            } else {
                println(error)
            }
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
