//
//  ViewController.swift
//  tipoos
//
//  Created by Usman Ajmal on 9/1/16.
//  Copyright © 2016 worotos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /**
     *  Dismiss keyboard on tapping main View
     */
    @IBAction func onTapMainView(sender: AnyObject) {
        view.endEditing(true)
    }
    
    /**
     *  Dynamically set tip
     */
    @IBAction func calculateTip(sender: AnyObject) {
        
        let tipPercentages = [0.15, 0.20, 0.25]
        
        // Get a valid string and convert to number
        // If input string is not a valid number show 0
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipSegment.selectedSegmentIndex]
        let total = bill + tip
        
        // Version 1
        //tipLabel.text = String(tip)
        //totalLabel.text = String(total)
        
        // Version 2
        //tipLabel.text = "$\(tip)"
        //totalLabel.text = "$\(total)"
        
        // Version 3
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}

