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
    @IBOutlet weak var resultView: UIView!
    
    @IBOutlet weak var shareBy2Label: UILabel!
    @IBOutlet weak var shareBy3Label: UILabel!
    @IBOutlet weak var shareBy4Label: UILabel!
    
    
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
        
        // Calculate tips shared by x number of people
        shareBy2Label.text = String(format: "$%.2f", total/2)
        shareBy3Label.text = String(format: "$%.2f", total/3)
        shareBy4Label.text = String(format: "$%.2f", total/4)
        
        // Reset bill, tip and total after 10 minutes
        NSTimer.scheduledTimerWithTimeInterval(600.0, target: self, selector: #selector(ViewController.reset), userInfo: nil, repeats: false)
    }
    
    /**
     *  Animate all UI elements on main view
     */
    func animateView () {
        
        // Store current value in order to set them at end of animation
        let xTip = self.tip.frame.origin.x
        let xTipLabel = self.tipLabel.frame.origin.x
        let xTotalLabel = self.totalLabel.frame.origin.x
        let xResultView = self.resultView.frame.origin.x
        let yBillField = self.billField.frame.origin.y
        let yTipSegment = self.tipSegment.frame.origin.y
        
        // Change init position of the elements
        self.tip.frame.origin.x = 1000
        self.tipLabel.frame.origin.x = 2000
        self.totalLabel.frame.origin.x = 3000
        self.resultView.frame.origin.x = 4000
        self.billField.frame.origin.y = -500
        self.tipSegment.frame.origin.y = 3000
        // self.resultView.alpha = 0
        
        UIView.animateWithDuration(1, animations: {
            // Slide from right
            self.tip.frame.origin.x = xTip
            self.tipLabel.frame.origin.x = xTipLabel
            self.totalLabel.frame.origin.x = xTotalLabel
            self.resultView.frame.origin.x = xResultView
            
            // Slide from top
            self.billField.frame.origin.y = yBillField
            
            // Slide from bottom
            self.tipSegment.frame.origin.y = yTipSegment
            
            // Fade in/out animation for blue view
            // containing result of the app i.e. Tip and Total
            // self.resultView.alpha = 1
        })
    }
    
    /**
     *  Reset placeholder, tip label, total label
     */
    func reset() {
        billField.text = ""
        billField.placeholder = "Add bill"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        shareBy2Label.text = "$0.00"
        shareBy3Label.text = "$0.00"
        shareBy4Label.text = "$0.00"
    }


}

