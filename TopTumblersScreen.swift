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

   
        
        
        

        
        
        
        //creating a query which retrive the title string from parse
        var query = PFQuery(className:"TopTumbler")
        query.getObjectInBackgroundWithId("KZKxYp9aWz") {
            (toptumblertitle: PFObject!, error: NSError!) -> Void in
            if error == nil && toptumblertitle != nil {
                self.topTumblerTitle = toptumblertitle["toptumblertitle"] as! String
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
                self.topTumblerText = toptumblertext["toptumblertext"] as! String
                self.topTumblerTextView.text = String(self.topTumblerText)
                //set the backgroundcolor of the text view
                self.topTumblerTextView.backgroundColor = UIColor .lightTextColor()


            } else {
                println(error)
            }
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func retrieveImage(){
        //creating a query which retrive the url string from parse for the profile image
        var queryurl = PFQuery(className:"TopTumbler")
        queryurl.getObjectInBackgroundWithId("KZKxYp9aWz") {
            (toptumblerurlimagepath: PFObject!, error: NSError!) -> Void in
            if error == nil && toptumblerurlimagepath != nil {
                self.topTumblerImageUrlPath = toptumblerurlimagepath["toptumblerurlimagepath"] as! String
                println(self.topTumblerImageUrlPath)
                //create variable "urll" which is equals to our retrieved imagelink string from parse
                let url = NSURL(string: self.topTumblerImageUrlPath)
                //get the image from the url
                let data = NSData(contentsOfURL: url!)
                //check that the image is downloaded
                if let data = NSData(contentsOfURL: url!){
                    //our profile image is equal to our image from parse via link
                    self.topTumblerImage.image = UIImage(data: data)
                    
                }
                
                
            } else {
                println(error)
            }
        }

    }
    
}
