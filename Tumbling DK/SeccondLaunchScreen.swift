//
//  SeccondLaunchScreen.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 03/04/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class SeccondLaunchScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var homeScreen: ViewController = self.storyboard?.instantiateViewControllerWithIdentifier("HomeScreen") as ViewController
        self.presentViewController(homeScreen, animated: true, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
