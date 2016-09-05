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
    
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var tip: UILabel!
    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var bar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        animateView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        // Load default tip value
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("default_tip") ?? 0
        
        debugPrint("Default Segment: $\(defaultTip)")
        
        tipSegment.selectedSegmentIndex = defaultTip
        calculateTip([:])
        
        animateView()
        
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
    
    /**
     *  Animate "Bill, Tip, Total", "Bill field, tip label, total label"
     *  and "horizontal bar, tip segment" by sliding them from left,
     *  right and bottom respectively
     */
    func animateView () {
        // Animate Bill, Tip and Total of default Tip
        let xBillLabel = self.billLabel.frame.origin.x
        let xTip = self.tip.frame.origin.x
        let xTotal = self.tip.frame.origin.x
        
        let xBillField = self.billField.frame.origin.x
        let xTipLabel = self.tipLabel.frame.origin.x
        let xTotalLabel = self.totalLabel.frame.origin.x
        
        let yBar = self.bar.frame.origin.y
        let yTipSegment = self.tipSegment.frame.origin.y
        
        self.billLabel.frame.origin.x = -100
        self.tip.frame.origin.x = -500
        self.total.frame.origin.x = -1000
        
        self.billField.frame.origin.x = 1000
        self.tipLabel.frame.origin.x = 1500
        self.totalLabel.frame.origin.x = 2000
        
        self.bar.frame.origin.y = 1000
        self.tipSegment.frame.origin.y = 3000
        
        UIView.animateWithDuration(1, animations: {
            self.billLabel.frame.origin.x = xBillLabel
            self.tip.frame.origin.x = xTip
            self.total.frame.origin.x = xTotal
            
            self.billField.frame.origin.x = xBillField
            self.tipLabel.frame.origin.x = xTipLabel
            self.totalLabel.frame.origin.x = xTotalLabel
            
            self.bar.frame.origin.y = yBar
            self.tipSegment.frame.origin.y = yTipSegment
        })
    }

}

