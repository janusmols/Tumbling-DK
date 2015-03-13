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
    var arrayOfPersons: [Person] = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpPersons()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpPersons(){
    
        var person1 = Person(name: "Nyheder")
        var person2 = Person(name: "Top Tumblere")
        var person3 = Person(name: "Sværdhedsrekorder")
        var person4 = Person(name: "Video")
        var person5 = Person(name: "Kalender")

        arrayOfPersons.append(person1)
        arrayOfPersons.append(person2)
        arrayOfPersons.append(person3)
        arrayOfPersons.append(person4)
        arrayOfPersons.append(person5)
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfPersons.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.dequeueReusableCellWithIdentifier("Cell") as CustomCell
        
        if indexPath.row % 2 == 0{
        
            cell.backgroundColor = UIColor.purpleColor()
        }
        else{
        
            cell.backgroundColor = UIColor.orangeColor()
        }
        
        let person = arrayOfPersons[indexPath.row]
        cell.setCell(person.name)
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        let person = arrayOfPersons[indexPath.row]
        
        var detailedViewController: DetailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as DetailViewController
        
        detailedViewController.nameString = person.name

        
        self.presentViewController(detailedViewController, animated: true, completion: nil)
        
    }
    
    
    
    
    
}
