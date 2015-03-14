//
//  CustomCell.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 13/03/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
//set up the label
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageOut: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
       
    func setCell(titleLabelText: String, imageName: String){
        
        self.titleLabel.text = titleLabelText
        self.imageOut.image = UIImage(named: imageName)
    }

}
