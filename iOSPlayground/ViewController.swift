//
//  ViewController.swift
//  iOSPlayground
//
//  Created by Fei Zheng on 11/21/16.
//  Copyright © 2016 Fei Zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    
    // Data model: These strings will be the data for the table view cells
    var animals: [String] = ["Basic Components", "Advanced Components", "Customized Components", "ViewController", "Animation"
    , "MultiThreading", "Networking", "Media", "System Service", "Map", "Pod"]
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection : Int) -> Int {
        return self.animals.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt : IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.animals[cellForRowAt.row]
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt : IndexPath) {
        print("You tapped cell number \(didSelectRowAt.row).")
        
        tableView.deselectRow(at: didSelectRowAt, animated: true)
        
        
        //let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: animals[didSelectRowAt.row]) as! BasicComponentViewController
        //self.present(nextViewController, animated : true, completion : nil)
        
        print("Go to a Navigate Controller")
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: animals[didSelectRowAt.row] + "Nav") as! UINavigationController
        self.present(nextViewController, animated : true, completion : nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        
        if segue.identifier == "Basic Components" {
            // Setup new view controller
            print("Navigate to Basic Components")
            
            
            
        }
    }
    
    @IBAction func unwindToMainController(sender: UIStoryboardSegue) {
        print("unwind to MainController")
        
    }
    
    // this method handles row deletion
    func tableView(_ tableView: UITableView, commit : UITableViewCellEditingStyle, forRowAt : IndexPath) {
        
        if commit == .delete {
            
            // remove the item from the data model
            animals.remove(at: forRowAt.row)
            
            // delete the table view row
            tableView.deleteRows(at: [forRowAt], with: .fade)
            
        } else if commit == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
        }
    }

}

