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
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpCategories(){
    //set up the the titles for the tableview
        var category1 = categories(title: "Nyheder", imageName: "img1")
        var category2 = categories(title: "Top Tumblere", imageName: "img2")
        var category3 = categories(title: "Sværhedsrekorder", imageName: "img3")
        var category4 = categories(title: "Video", imageName: "img4")
        var category5 = categories(title: "Kalender", imageName: "img5")

        //connect the titles to the categoryarray
        arrayOfCategories.append(category1)
        arrayOfCategories.append(category2)
        arrayOfCategories.append(category3)
        arrayOfCategories.append(category4)
        arrayOfCategories.append(category5)
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //numbers of titles in the array is equal to the rows in the tableview
        return arrayOfCategories.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //initialize the cell
        let cell: CustomCell = tableView.dequeueReusableCellWithIdentifier("Cell") as CustomCell
        //Set the backgroundcolor of the cells
        cell.backgroundColor = UIColor.groupTableViewBackgroundColor()

        let categories = arrayOfCategories[indexPath.row]
        
        cell.setCell(categories.title, imageName: categories.imageName)
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        let categories = arrayOfCategories[indexPath.row]
        
        var detailedViewController: DetailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as DetailViewController
        
        detailedViewController.nameString = categories.title

        
        self.presentViewController(detailedViewController, animated: true, completion: nil)
        
    }
    
    
    
    
    
}
