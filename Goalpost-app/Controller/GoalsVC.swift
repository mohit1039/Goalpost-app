//
//  GoalsVC.swift
//  Goalpost-app
//
//  Created by Mohit Gupta on 11/03/21.
//

import UIKit
import CoreData


let appDelegate = UIApplication.shared.delegate as? AppDelegate
class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }

    @IBAction func addGoalTap(_ sender: Any) {
        
        guard let createGoalVC = storyboard?.instantiateViewController(identifier: "CreateGoalsVC") else { return  }
        presentDetails(createGoalVC)
    }
    
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell() }
        
        cell.configureCell(description: "Eat salad for twice a week", type: .shortTerm, goalProgressAmount: 2)
        
        return cell
    }
    
    
    
    
    
}

extension GoalsVC{
    func fetch(completion : (_ complete: Bool) -> ()){
        
    }
}

