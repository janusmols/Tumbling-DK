//
//  DetailViewController.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 13/03/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class NewsScreen: UIViewController {
    

    
   @IBOutlet weak var newsLabel: UITextView!
    
   var newstext = "blank"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        var query = PFQuery(className:"NewsFeed")
        query.getObjectInBackgroundWithId("bvNjukdApA") {
            (newsfeed: PFObject!, error: NSError!) -> Void in
            if error == nil && newsfeed != nil {
                
                println(newsfeed["newsfeed"] as String)
                self.newstext = newsfeed["newsfeed"] as String
                println(self.newstext)
                self.newsLabel.text = String(self.newstext)
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
