//
//  VideoScreen.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 14/03/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class VideoScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().openURL(NSURL(string:"https://www.youtube.com/watch?v=IuGoU5WV0D8")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
