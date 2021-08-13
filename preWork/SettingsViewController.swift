//
//  SettingsViewController.swift
//  preWork
//
//  Created by Blane Brown on 8/13/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var partySizeControl: UISegmentedControl!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let partySize = defaults.integer(forKey: "partySize")
        partySizeControl.selectedSegmentIndex = partySize - 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func partySizeSelection(_ sender: Any) {
        let partySizeArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let partySize = partySizeArray[partySizeControl.selectedSegmentIndex]
        
        let defaults = UserDefaults.standard
        defaults.set(partySize, forKey: "partySize")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
