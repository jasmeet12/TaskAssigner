//
//  tableViewCell.swift
//  TaskManager
//
//  Created by Jasmeet Kaur on 18/03/19.
//  Copyright © 2019 Jasmeet Kaur. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell:UITableViewCell{
    
    @IBOutlet weak var circleView:UIView!
    @IBOutlet weak var taskLabel:UILabel!
    @IBOutlet weak var timeLabel:UILabel!
    @IBOutlet weak var expandButton:UIButton!
    @IBOutlet weak var userImage:UIImageView!
    @IBOutlet weak var sideLine:UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: taskModel) {
        taskLabel.text = model.task
        timeLabel.text = model.time
       
        userImage.image = model.image
        circleView.layer.cornerRadius = 5.0
        
    }
    
    
}

struct taskModel{
    
    let circle:Int
    let task:String
    let time:String
    let image:UIImage
    
    
}
