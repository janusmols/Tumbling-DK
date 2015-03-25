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
    @IBOutlet weak var activity: UIActivityIndicatorView!
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
                
                var alert = UIAlertController(title: "Connection error", message: "Unable to connect with the server. Check your internet connection and try again", preferredStyle: UIAlertControllerStyle.Alert)
                self.presentViewController(alert, animated: true, completion: nil)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
                    switch action.style{
                    case .Default:
                        var homeScreen: ViewController = self.storyboard?.instantiateViewControllerWithIdentifier("HomeScreen") as ViewController
                        self.presentViewController(homeScreen, animated: true, completion: nil)

                    case .Cancel:
                        println("cancel")
                        
                    case .Destructive:
                        println("destructive")
                    }
                }
                    )
                )
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


    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
