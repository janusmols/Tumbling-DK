//
//  TopTumblersScreen.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 14/03/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class TopTumblersScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
