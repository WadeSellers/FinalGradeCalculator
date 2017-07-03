//
//  ViewController.swift
//  FinalGradeCalculator
//
//  Created by Wade Sellers on 4/15/17.
//  Copyright © 2017 MobileMakersEDU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentGradeTextField: UITextField!
    @IBOutlet weak var desiredGradeTextField: UITextField!
    @IBOutlet weak var finalExamWeightTextField: UITextField!
    
    var neededFinalExamGrade:Double?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onCalculateButtonTapped(_ sender: UIButton) {
        calculateFinalExamGradeNeeded()
    }

    func calculateFinalExamGradeNeeded() {
        // WE need to use an algorithm to calculate this.
        // I found the formula for this at...
        // https://rogerhub.com/final-grade-calculator/
        // (100 * desiredGrade - (100 - finalWeight) * curGrade) / finalWeight
        
        let desiredGrade = Double(desiredGradeTextField.text!)!
        let currentGrade = Double(currentGradeTextField.text!)!
        let finalExamWeight = Double(finalExamWeightTextField.text!)!

        neededFinalExamGrade = (100 * desiredGrade - (100 - finalExamWeight) * currentGrade) / finalExamWeight
        print(neededFinalExamGrade!)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFromViewControllerToResultsViewController" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.neededFinalExamGrade = neededFinalExamGrade
        }
    }

}


