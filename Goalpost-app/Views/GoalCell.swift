//
//  GoalCell.swift
//  Goalpost-app
//
//  Created by Mohit Gupta on 19/03/21.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionlbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    
    func configureCell(description: String, type: GoalType, goalProgressAmount: Int) {
        self.goalDescriptionlbl.text = description
        self.goalTypeLbl.text = type.rawValue
        self.goalProgressLbl.text = String(describing: goalProgressAmount)
    }
}
