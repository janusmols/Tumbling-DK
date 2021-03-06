//
//  ViewController.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 13/03/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //Connect tableview
    @IBOutlet weak var myTableView: UITableView!
    //initialize the category array
    var arrayOfCategories: [categories] = [categories]()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //call the setUpCategories func
        self.setUpCategories()
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenHeight = screenSize.height
        self.myTableView.rowHeight = (screenHeight-87)/7
        
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
    
    func setUpCategories(){
        //set up the the titles for the tableview
        var category1 = categories(title: "Nyheder", imageName: "img1")
        var category2 = categories(title: "LiveScore", imageName: "img7")
        var category3 = categories(title: "Sværhedsrekorder", imageName: "img3")
        var category4 = categories(title: "Video", imageName: "img4")
        var category5 = categories(title: "Kalender", imageName: "img5")
        var category6 = categories(title: "Resultater", imageName: "img6")
        var category7 = categories(title: "Top tumblere", imageName: "img2")
        
        //connect the titles to the categoryarray
        arrayOfCategories.append(category1)
        arrayOfCategories.append(category2)
        arrayOfCategories.append(category3)
        arrayOfCategories.append(category4)
        arrayOfCategories.append(category5)
        arrayOfCategories.append(category6)
        arrayOfCategories.append(category7)
}
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //numbers of titles in the array is equal to the rows in the tableview
        return arrayOfCategories.count
}
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //initialize the cell
        let cell: CustomCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! CustomCell
        
        let categories = arrayOfCategories[indexPath.row]
        
        cell.setCell(categories.title, imageName: categories.imageName)
        
        
        
        return cell
}
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let categoriesrow = arrayOfCategories[indexPath.row]
        
        //The category you choose would send you to its own View
        switch(indexPath.row){
            
        case 0:
            var newsScreen: NewsScreen = self.storyboard?.instantiateViewControllerWithIdentifier("NewsScreen") as! NewsScreen
            self.presentViewController(newsScreen, animated: true, completion: nil)
            break
            
        case 1:
            var liveScoreScreen: LiveScoreScreen = self.storyboard?.instantiateViewControllerWithIdentifier("LiveScoreScreen") as! LiveScoreScreen
            self.presentViewController(liveScoreScreen, animated: true, completion: nil)
            break
            
        case 2:
            var recordsScreen: RecordsScreen = self.storyboard?.instantiateViewControllerWithIdentifier("RecordsScreen") as! RecordsScreen
            self.presentViewController(recordsScreen, animated: true, completion: nil)
            break
            
        case 3:
            var videoScreen: VideoScreen = self.storyboard?.instantiateViewControllerWithIdentifier("VideoScreen") as! VideoScreen
            self.presentViewController(videoScreen, animated: true, completion: nil)
            break
            
        case 4:
            var calenderScreen: CalenderScreen = self.storyboard?.instantiateViewControllerWithIdentifier("CalenderScreen") as! CalenderScreen
            self.presentViewController(calenderScreen, animated: true, completion: nil)
            break
            
        case 5:
            var resultScreen: ResultScreen = self.storyboard?.instantiateViewControllerWithIdentifier("ResultScreen") as! ResultScreen
            self.presentViewController(resultScreen, animated: true, completion: nil)
            break
            
        case 6:
            var topTumblersScreen: TopTumblersScreen = self.storyboard?.instantiateViewControllerWithIdentifier("TopTumblersScreen") as! TopTumblersScreen
            self.presentViewController(topTumblersScreen, animated: true, completion: nil)
            break
            

            
        default:
            break
            
            
            
            
        }
        
        
        
    }
    
    
    
    
    
}
