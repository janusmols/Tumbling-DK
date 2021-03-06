//
//  LiveScoreScreen.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 19/04/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class LiveScoreScreen: UIViewController {

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
                
                println(urlpath["urlpathlivescore"] as! String)
                self.URLString = urlpath["urlpathlivescore"] as! String
                println(self.URLString)
                
                //if there not is a livescore event avalible then send a error messeage
                if self.URLString == ""{
                    var alert = UIAlertController(title: "Connection error", message: "Der er i øjeblikket ingen LiveScore tilgængelig prøv venligst igen senere eller se hvornår den næste konkurrence afholdes i vores kalender", preferredStyle: UIAlertControllerStyle.Alert)
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
                        switch action.style{
                        case .Default:
                            var homeScreen: ViewController = self.storyboard?.instantiateViewControllerWithIdentifier("HomeScreen") as! ViewController
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
                //set up the webview
                let requestURL = NSURL(string: self.URLString)
                let request = NSURLRequest(URL:requestURL!)
                self.webView.loadRequest(request)
            } else {
                println(error)
                //AlertView if no network conection
                var alert = UIAlertController(title: "Connection error", message: "Unable to connect with the server. Check your internet connection and try again", preferredStyle: UIAlertControllerStyle.Alert)
                self.presentViewController(alert, animated: true, completion: nil)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
                    switch action.style{
                    case .Default:
                        var homeScreen: ViewController = self.storyboard?.instantiateViewControllerWithIdentifier("HomeScreen") as! ViewController
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
    

}
