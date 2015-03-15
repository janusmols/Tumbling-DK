//
//  CalenderScreen.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 14/03/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class CalenderScreen: UIViewController {

    
    
    @IBOutlet weak var webView: UIWebView!
    var URLString = "blank"
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //retrive the url for the calender
        var query = PFQuery(className:"URLPath")
        query.getObjectInBackgroundWithId("fd1nxMUxys") {
            (urlpath: PFObject!, error: NSError!) -> Void in
            if error == nil && urlpath != nil {
                
                println(urlpath["urlpath"] as String)
                self.URLString = urlpath["urlpath"] as String
                println(self.URLString)
        //set up the webview
        let requestURL = NSURL(string: self.URLString)
        let request = NSURLRequest(URL:requestURL!)
        self.webView.loadRequest(request)
                
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
