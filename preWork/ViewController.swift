//
//  ViewController.swift
//  preWork
//
//  Created by Blane Brown on 8/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.textEffect: UIColor.red], for: .selected)
        //get bill amount from billAmountTextField
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //get tip and total bill costs
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //update amount labels based on location and incldues commas/periods
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        if let formattedTip = formatter.string(from: tip as NSNumber){
            tipAmountLabel.text = "\(formattedTip)"
        }
        if let formattedTotal = formatter.string(from: total as NSNumber){
            totalLabel.text = "\(formattedTotal)"
        }
    }
    
   
    
    
    


}

