//
//  CellCustom.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 08/04/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class CellVideo: UITableViewCell {
    
    
    @IBOutlet weak var webView: UIWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell(videoURL: String){
        //set up the webview
        let requestURL = NSURL(string: videoURL)
        let request = NSURLRequest(URL:requestURL!)
        self.webView.loadRequest(request)
        webView.scrollView.scrollEnabled = false
        
        
        
    }
    
    
    
}
