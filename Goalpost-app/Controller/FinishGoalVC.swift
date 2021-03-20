//
//  FinishGoalVC.swift
//  Goalpost-app
//
//  Created by Mohit Gupta on 20/03/21.
//

import UIKit
import CoreData



class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointTextField: UITextField!
    
    
    var goalDescription: String!
    var goalType: GoalType!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pointTextField.delegate = self
        createGoalBtn.bindToKeyboard()
        // Do any additional setup after loading the view.
    }
    
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismissDetails()
    }
    
    @IBAction func creatGoalBtntapped(_ sender: Any) {
        
        if pointTextField.text != ""{
            self.save{(complete) in
                if complete{
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    func save(completion: (_ complete : Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointTextField.text!)!
        goal.goalProgress = Int32(0)
        do{
            
            try managedContext.save()
            completion(true)
        }catch{
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
        
    }
    
}
