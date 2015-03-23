//
//  VideoScreen.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 14/03/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class VideoScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //Conect tableview
    @IBOutlet weak var tableView: UITableView!
    //initialize the Video array
    var arrayOfVideos: [Videos] = [Videos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //call the setUpvideos func
        self.setUpVideos()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}



func setUpVideos(){
    //set up the the titles for the tableview
    var video1 = Videos(videoURL: "https://www.youtube.com/watch?v=OvSf6kk07uE")
    var video2 = Videos(videoURL: "https://www.youtube.com/watch?v=fcLQPQ02VwE")
    
    //connect the videos to the videoarray
    arrayOfVideos.append(video1)
    arrayOfVideos.append(video2)
}

func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //numbers of titles in the array is equal to the rows in the tableview
    return arrayOfVideos.count
}

func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //initialize the cell
    let cell: VideoCell = tableView.dequeueReusableCellWithIdentifier("Cell") as VideoCell
    
    let videos = arrayOfVideos[indexPath.row]
    
    cell.setCell(videos.videoURL)
    
    return cell
}

func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    let categoriesrow = arrayOfVideos[indexPath.row]
    
    //The category you choose would send you to its own View
    switch(indexPath.row){
        
    case 0:

        break
        
    default:
        break
        
        
        
        
    }

    
}
    
}

