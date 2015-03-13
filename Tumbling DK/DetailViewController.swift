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
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var myDetailedImageView: UIImageView!

    var nameString: String?
    var ageInt: Int?
    var myDetailedImageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = nameString
        self.ageLabel.text = "\(ageInt)"
        self.myDetailedImageView.image = UIImage(named: myDetailedImageName!)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    }
