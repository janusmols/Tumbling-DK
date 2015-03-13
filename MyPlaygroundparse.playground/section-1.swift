// Playground - noun: a place where people can play

import UIKit

// save objects for example string
var testObject:PFObject = PFObject(className:"TestObject")
testObject["mitNavn"] = "janus"
testObject.saveInBackgroundWithBlock {
    (success: Bool, error: NSError!) -> Void in
    if (success) {
        // The object has been saved.
        println("succesfull saved object")
    } else {
        // There was a problem, check error.description
        println("error saving the object")
    }
}

