//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Rita-Maria Oladokun on 2025-01-30.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var weigthTextField: UITextField!
    @IBOutlet weak var heigthTextField: UITextField!
    
    @IBOutlet weak var measurementSystem: UISegmentedControl!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var weigthUnit: UILabel!
    @IBOutlet weak var heigthUnit: UILabel!
    
    // measurement choice

    @IBAction func measurementUnit(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            weigthUnit.text = "KG"
            heigthUnit.text = "CM"
        } else {
            weigthUnit.text = "LB"
            heigthUnit.text = "IN"
        }
    }
    // new comment to track changes
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "Your BMI wil be displayed here"
    }

    
    // calculate bmi
    @IBAction func calculateBMI(_ sender: UIButton) {
        let weigthText = weigthTextField.text ?? ""
        let heigthText = heigthTextField.text ?? ""
        
        if weigthText.isEmpty || heigthText.isEmpty {
            resultLabel.text = "You need to enter a weight and height"
        }
        if let weigth = Double(weigthText), let heigth = Double(heigthText) {
            print(weigth, heigth)
            if weigth <= 0.0 || heigth <= 0.0 {
                resultLabel.text = "weight and height must be positive"
                return;
            }
            
            let isSI = measurementSystem.selectedSegmentIndex == 0
            let weigthKG = isSI ? weigth : weigth * 0.453592
            let heigthM = isSI ? heigth / 100 : heigth * 0.0254
            let bmi = weigthKG / (heigthM * heigthM)
            
            resultLabel.text = "BMI =\(String(format: "%.2f", bmi)), Category = \(bmiCategory(bmi))"
            
        } else {
            resultLabel.text = "Enter valid numbers"
        }
    }
    
    // implement bmi categories
    func bmiCategory (_ bmi: Double) -> String{
        if bmi < 18.5 {
            return "Underweigth"
        } else if bmi >= 18.5 && bmi <= 24.9 {
            return "Normal weigth"
        } else if bmi > 25 && bmi <= 29.9 {
            return "Overweight"
        }
        else {
            return "Obesity"
        }
    }
    
    
    
}

