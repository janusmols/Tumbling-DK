//
//  DetailViewController.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 13/03/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!

    var nameString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = nameString
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
       // self.dismissViewControllerAnimated(true, completion: nil)
    
    var homeViewController: ViewController = self.storyboard?.instantiateViewControllerWithIdentifier("homeViewController") as ViewController
    self.presentViewController(homeViewController, animated: true, completion: nil)
    }

    }
