//
//  PodViewController.swift
//  iOSPlayground
//
//  Created by Fei Zheng on 11/25/16.
//  Copyright © 2016 Fei Zheng. All rights reserved.
//

import UIKit
import JTFadingInfoView

class PodViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Navigate to PodViewController")
        setupInfoView()
    }
    
    func setupInfoView() {
        let frame = CGRect(x : 100, y : 100, width : 100, height : 100)
        let label = "This is a test"
        
        let infoView : JTFadingInfoView = JTFadingInfoView(frame : frame, label : label)
        
        infoView.isAnimationEnabled = true
        infoView.isShadowEnabled = true
        infoView.appearingDuration = 5.0
        infoView.disappearingDuration = 2.0
        infoView.displayDuration = 10.0
        infoView.animationMovement = 40.0
        
        infoView.fadeInDirection = JTFadeInDirectionFromLeft
        infoView.fadeOutDirection = JTFadeOutDirectionToBelow
        
        self.view.addSubview(infoView)
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
