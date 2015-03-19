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
    var topTumblerImageUrlPath = ""
    var topTumblerPersonImage = UIImage(named: "")

    override func viewDidLoad() {
        super.viewDidLoad()

        //users can't edit the twxt
        topTumblerTextView.editable = false
   
        
        //creating a query which retrive the url string from parse for the profile image
        var queryurl = PFQuery(className:"TopTumbler")
        queryurl.getObjectInBackgroundWithId("KZKxYp9aWz") {
            (toptumblerurlimagepath: PFObject!, error: NSError!) -> Void in
            if error == nil && toptumblerurlimagepath != nil {
                
                println(toptumblerurlimagepath["toptumblerurlimagepath"] as String)
                self.topTumblerImageUrlPath = toptumblerurlimagepath["toptumblerurlimagepath"] as String
                println(self.topTumblerImageUrlPath)
              
                
            } else {
                println(error)
            }
        }
        
        
        
        
        let url = NSURL(string: "http://files.parsetfss.com/e2383a7f-8dfb-4899-99c7-3637243bd0ac/tfss-d91fed70-e5be-4729-af93-324c4e6ef19e-Untitled%202.png")
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        topTumblerImage.image = UIImage(data: data!)!

        
        
        

        
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
