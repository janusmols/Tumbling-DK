//
//  VideoScreen.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 14/03/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class VideoScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //activity icon 
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    //Conect tableview
    @IBOutlet weak var tableView: UITableView!
    //initialize the Video array
    var arrayOfVideos: [Videos] = [Videos]()
    
    var myArray: NSMutableArray! = NSMutableArray()
    

    
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

    //set up the the different youtube videos for the tableview
    var video1 = Videos(videoURL: "https://www.youtube.com/watch?v=OvSf6kk07uE")
    var video2 = Videos(videoURL: "https://www.youtube.com/watch?v=fcLQPQ02VwE")
    var video3 = Videos(videoURL: "https://www.youtube.com/watch?v=T-SAHgs7IEY")
    //connect the videos to the videoarray
    arrayOfVideos.append(video1)
    arrayOfVideos.append(video2)
    arrayOfVideos.append(video3)
}

func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //numbers of videos in the array is equal to the rows in the tableview
    return arrayOfVideos.count
}

func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //initialize the cell
    let cell: VideoCell = tableView.dequeueReusableCellWithIdentifier("Cell") as VideoCell
    
    let videos = arrayOfVideos[indexPath.row]
    
    cell.setCell(videos.videoURL)
    
    return cell
}



    
}

