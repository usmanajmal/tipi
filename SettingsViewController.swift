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
    }
}
