//
//  PodViewController.swift
//  iOSPlayground
//
//  Created by Fei Zheng on 11/25/16.
//  Copyright © 2016 Fei Zheng. All rights reserved.
//

import UIKit
import JTFadingInfoView
import Alamofire
import AlamofireImage
import SwiftyJSON

class PodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var arrRes = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        print("Navigate to PodViewController")
        
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { [weak weakSelf = self] (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["contacts"].arrayObject {
                    weakSelf?.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    weakSelf?.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : AlamoFireTableCell = tableView.dequeueReusableCell(withIdentifier: "reUseCell")! as! AlamoFireTableCell
        var dict = arrRes[indexPath.row]
        cell.nameLabel?.text = dict["name"] as? String
        cell.emailLabel?.text = dict["email"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
