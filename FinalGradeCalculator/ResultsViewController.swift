//
//  ResultsViewController.swift
//  FinalGradeCalculator
//
//  Created by Wade Sellers on 4/16/17.
//  Copyright © 2017 MobileMakersEDU. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var finalExamGradeLabel: UILabel!
    
    var neededFinalExamGrade:Double!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()

        if neededFinalExamGrade > 100 {
            resultsLabel.text = "Grade needed on final exam to achieve your desired class grade... You should ask your teacher for extra credit opportunities."
            view.backgroundColor = UIColor.red
        } else {
            resultsLabel.text = "Grade needed on final exam to achieve your desired class grade..."
            view.backgroundColor = UIColor.green
        }

        finalExamGradeLabel.text = String(format:"%.1f", neededFinalExamGrade) + "%"
    }

    override var canBecomeFirstResponder: Bool { return true }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func onStartOverButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
