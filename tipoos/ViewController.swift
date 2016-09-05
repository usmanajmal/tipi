//
//  ViewController.swift
//  tipi
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
    
    @IBOutlet weak var tip: UILabel!
    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var resultView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Animate the view on loading
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
    
    override func viewDidAppear(animated: Bool) {
        // Show keyboard by default
        billField.becomeFirstResponder()
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
        
        // Reset bill, tip and total after 10 minutes
        NSTimer.scheduledTimerWithTimeInterval(600.0, target: self, selector: #selector(ViewController.reset), userInfo: nil, repeats: false)
    }
    
    /**
     *  Animate all UI elements on main view
     */
    func animateView () {
        // Animate Bill, Tip and Total of default Tip
        let xTip = self.tip.frame.origin.x
        let xTotal = self.tip.frame.origin.x
        
        let xTipLabel = self.tipLabel.frame.origin.x
        let xTotalLabel = self.totalLabel.frame.origin.x
        
        let yBillField = self.billField.frame.origin.y

        let yTipSegment = self.tipSegment.frame.origin.y
        
        self.tip.frame.origin.x = -500
        self.total.frame.origin.x = -1000
        
        self.tipLabel.frame.origin.x = 1500
        self.totalLabel.frame.origin.x = 2000
        
        self.billField.frame.origin.y = -500
        
        self.tipSegment.frame.origin.y = 3000
        
        self.resultView.alpha = 0
        
        UIView.animateWithDuration(1, animations: {
            // Slide from left
            self.tip.frame.origin.x = xTip
            self.total.frame.origin.x = xTotal
            
            // Slide from right
            self.tipLabel.frame.origin.x = xTipLabel
            self.totalLabel.frame.origin.x = xTotalLabel
            
            // Slide from top
            self.billField.frame.origin.y = yBillField
            
            // Slide from bottom
            self.tipSegment.frame.origin.y = yTipSegment
            
            // Fade in/out animation for blue view
            // containing result of the app i.e. Tip and Total
            self.resultView.alpha = 1
        })
    }
    
    func reset() {
        billField.text = ""
        billField.placeholder = "Add bill"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        
    }


}

