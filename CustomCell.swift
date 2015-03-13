//
//  CustomCell.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 13/03/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel! 
    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
       
    func setCell(leftLabelText: String, rightLabelInt: Int, imageName: String){
        
        self.leftLabel.text = leftLabelText
        self.rightLabel.text = String(rightLabelInt)
        self.myImageView.image = UIImage(named: imageName)
    }

}
