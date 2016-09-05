//
//  SettingsViewController.swift
//  tipoos
//
//  Created by Usman Ajmal on 9/3/16.
//  Copyright © 2016 worotos. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipLabel: UILabel!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let title = ["15%", "20%", "25%"]
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip  = defaults.integerForKey("default_tip") ?? 0

        // Change label to currently set default value
        defaultTipLabel.text = title[defaultTip]
        
        // Set segment programatically to current set default value
        //tipSegment.setEnabled(true, forSegmentAtIndex: defaultTip)
        tipSegment.selectedSegmentIndex = defaultTip
        
        /* Animate appearance of default Tip
        self.defaultTipLabel.alpha = 0
        UIView.animateWithDuration(2, animations: {
            self.defaultTipLabel.alpha = 1
        })*/
        
        tipHeartBeat()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    /**
     *  Set default tip
     */
    @IBAction func setDefaultTip(sender: AnyObject) {
        let title = ["15%", "20%", "25%"]
        let selectedSegmentIndex = tipSegment.selectedSegmentIndex ?? 0
        let defaultValue = title[selectedSegmentIndex]
        let defaults = NSUserDefaults.standardUserDefaults()
        
        // Save the default value
        defaults.setInteger(selectedSegmentIndex, forKey: "default_tip")
        defaults.synchronize()
        
        // Change label
        defaultTipLabel.text = defaultValue
        
        tipHeartBeat()
    }
    
    /**
     *  Use an animation to transform text size
     *  Source: http://stackoverflow.com/questions/25100750/animating-a-label-to-increase-and-decrease-in-size
     */
    func tipHeartBeat() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = NSNumber(float: 0.9)
        animation.duration = 0.3
        animation.repeatCount = 2.0
        animation.autoreverses = true
        self.defaultTipLabel.layer.addAnimation(animation, forKey: nil)
    }
}
