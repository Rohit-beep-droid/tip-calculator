//
//  ViewController.swift
//  TipCalculator
//
//  Created by Rohit Barua on 7/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Variables for each label, segement control, and
    // textfield on the view controller
    @IBOutlet weak var perPersonAmount: UILabel!
    @IBOutlet weak var partyTotal: UILabel!
    @IBOutlet weak var partyStepper: UIStepper!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    // Main view loader
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.becomeFirstResponder()
    }
    
    // Function to make the keyboard disappear
    // when the user clicks off of text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Stepper function to give real time feedback
    // on the application
    @IBAction func stepperValue(_ sender: UIStepper) {
        partyTotal.text = String(Int(sender.value))
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // A variable to stored user input of bill
        let currentBill = Double(billAmountTextField.text!) ?? 0
        
        // The keyboard will disappear after clicking
        // outside the text field
        self.billAmountTextField.resignFirstResponder()
        
        // Variables to store the tip percentages,
        // party size, and final tip amount
        let party = Double(partyTotal.text!) ?? 0
        let percentages = [0.1, 0.15, 0.2, 0.25]
        let tipAmount = currentBill * percentages[tipControl.selectedSegmentIndex]
        
        // Total bill including tip
        let total =  tipAmount + currentBill
        // Total bill each person will have to contribute
        let partyTotal = total/party
        
        // Output of all each amount
        tipAmountLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", total)
        perPersonAmount.text = String(format: "$%.2f", partyTotal)
    }
}

