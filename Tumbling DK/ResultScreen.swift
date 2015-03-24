//
//  ResultScreen.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 24/03/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit


class ResultScreen: UIViewController {
    @IBOutlet weak var webview: UIWebView!
    var URLString = "blank"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //retrive the url for the calender
        var query = PFQuery(className:"URLPath")
        query.getObjectInBackgroundWithId("fd1nxMUxys") {
            (urlpathresult: PFObject!, error: NSError!) -> Void in
            if error == nil && urlpathresult != nil {
                
                println(urlpathresult["urlpathresult"] as String)
                self.URLString = urlpathresult["urlpathresult"] as String
                println(self.URLString)
                //set up the webview
                let requestURL = NSURL(string: self.URLString)
                let request = NSURLRequest(URL:requestURL!)
                self.webview.loadRequest(request)
                
            } else {
                println(error)
            }
        }

        
    }

}
