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
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        let partySize = defaults.integer(forKey: "partySize")
        
        //get bill amount from billAmountTextField
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //get tip and total bill costs
        let tipPercentages = [0.00, 0.15, 0.18, 0.20]
        let sliderTipPercentages = [0, 15, 18, 20]
        slider.setValue(Float(sliderTipPercentages[tipControl.selectedSegmentIndex]), animated: true)
        sliderLabel.text = "%\(sliderTipPercentages[tipControl.selectedSegmentIndex])"
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = (bill + tip)/Double(partySize)
        
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
    
    
    @IBAction func chooseTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        let partySize = defaults.integer(forKey: "partySize")
        
        let sv = slider.value
        sliderLabel.text = "%\(Int(sv))"
        
        tipControl.selectedSegmentIndex = 0
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = Float(bill) * (slider.value * 0.01)
        let total = (bill + Double(tip))/Double(partySize)
        
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

