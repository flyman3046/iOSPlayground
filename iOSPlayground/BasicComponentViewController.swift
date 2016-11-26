//
//  BasicComponentViewController.swift
//  iOSPlayground
//
//  Created by Fei Zheng on 11/22/16.
//  Copyright © 2016 Fei Zheng. All rights reserved.
//

import UIKit

class BasicComponentViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("BasicComponentViewContrller view initiated")
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
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        if mySwitch.isOn {
            myLabel.text = "The Switch is Off"
            mySwitch.setOn(false, animated:true)
        } else {
            myLabel.text = "The Switch is On"
            mySwitch.setOn(true, animated:true)
        }
        
    }
    
    @IBAction func switchClicked(_ sender: UISwitch) {
        myLabel.text = "switch is clicked"
        
    }
    

}
