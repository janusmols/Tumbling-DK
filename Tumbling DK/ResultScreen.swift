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
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
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
                self.webview.scalesPageToFit = true
                
                
            } else {
                println(error)
            }
        }

        
}

    func webViewDidStartLoad(_: UIWebView){
        //Sart spinning
        activity.hidden = false
        activity.startAnimating()
        
        println("startload")
    
}
    
    func webViewDidFinishLoad(_: UIWebView){
        //stop spinning
        activity.hidden = true
        activity.stopAnimating()
   
        println("stopload")
    }
}
