//
//  ViewController.swift
//  Tumbling DK
//
//  Created by Janus Broch Mols on 13/03/15.
//  Copyright (c) 2015 Janus Broch Mols. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myTableView: UITableView!
    var arrayOfCategories: [categories] = [categories]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpCategories()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpCategories(){
    
        var category1 = categories(name: "Nyheder")
        var category2 = categories(name: "Top Tumblere")
        var category3 = categories(name: "Sværdhedsrekorder")
        var category4 = categories(name: "Video")
        var category5 = categories(name: "Kalender")

        arrayOfCategories.append(category1)
        arrayOfCategories.append(category2)
        arrayOfCategories.append(category3)
        arrayOfCategories.append(category4)
        arrayOfCategories.append(category5)
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfCategories.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.dequeueReusableCellWithIdentifier("Cell") as CustomCell
        
        if indexPath.row % 2 == 0{
        
            cell.backgroundColor = UIColor.purpleColor()
        }
        else{
        
            cell.backgroundColor = UIColor.orangeColor()
        }
        
        let person = arrayOfCategories[indexPath.row]
        cell.setCell(person.name)
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        let person = arrayOfCategories[indexPath.row]
        
        var detailedViewController: DetailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as DetailViewController
        
        detailedViewController.nameString = person.name

        
        self.presentViewController(detailedViewController, animated: true, completion: nil)
        
    }
    
    
    
    
    
}
