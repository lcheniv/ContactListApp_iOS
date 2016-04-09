//
//  FirstViewController.swift
//  To Do List
//
//  Created by Lawrence Chen on 1/27/16.
//  Copyright © 2016 Lawrence Chen. All rights reserved.
//

import UIKit

// Initializing variable outside of class so it can be
// used by the SecondViewController 

// Define our array for us as soon as the app is loaded
var toDoList = [String]()

var contactInfo = [String]()


class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var toDoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil){
        
        toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
            
        }
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("contactInfo") != nil){
            
            contactInfo = NSUserDefaults.standardUserDefaults().objectForKey("contactInfo") as! [String]
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return toDoList.count
        
    }
    
    
    // Cells prototype gets identified by its identifier "cell" and then the cell's text gets set
    // by using the toDoList array and getting the indexPath.row
    // finally ---- return cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = 	UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
        
    }
    
    // Need to update value in table every time the above view appears
    // so this can be down with 
    
    override func viewDidAppear(animated: Bool) {
        
        // Updating the table with reloadData()
        toDoListTable.reloadData()
        
    }
    
    
    // SWIPE LEFT TO DELETE METHOD! -----------------------------------
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        // To check for a swipe to the left
        if (editingStyle == UITableViewCellEditingStyle.Delete){
        
            // Updates array version
            toDoList.removeAtIndex(indexPath.row)
            
            // Updates the perm storage version
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            
            toDoListTable.reloadData()
            
        }
        
    }
    
    


}

