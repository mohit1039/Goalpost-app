//
//  CreateGoalVC.swift
//  Goalpost-app
//
//  Created by Mohit Gupta on 19/03/21.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var goalType: GoalType = .shortTerm
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalTextView.delegate = self
        nextButton.bindToKeyboard()
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
    }
    
    @IBAction func shortTermTap(_ sender: Any) {
        goalType = .shortTerm
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
        view.endEditing(true)
    }
    
    @IBAction func longTermTap(_ sender: Any) {
        goalType = .longTerm
        shortTermButton.setDeselectedColor()
        longTermButton.setSelectedColor()
        view.endEditing(true)
    }
    @IBAction func nextTap(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal"{
            guard let finishGoalVc = storyboard?.instantiateViewController(identifier: "FinishGoalVC") as? FinishGoalVC else { return }
            finishGoalVc.initData(description: goalTextView.text!, type: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalVc)
            
        }
    }
    @IBAction func backButtonTap(_ sender: Any) {
        
        dismissDetails()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
    }

}
