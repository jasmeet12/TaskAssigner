//
//  CollectionViewCell.swift
//  TaskManager
//
//  Created by Jasmeet Kaur on 18/03/19.
//  Copyright © 2019 Jasmeet Kaur. All rights reserved.
//

import Foundation

import UIKit

class CollectionViewCell:UICollectionViewCell{
    
 
    @IBOutlet weak var dayLabel:UILabel!
    @IBOutlet weak var dateLabel:UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: dateModel,index:Int) {
        dayLabel.text = model.day
        dateLabel.text = model.date
        
        if (index%2 == 0){
            self.backgroundColor = #colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3254901961, alpha: 0.7177065497)
            
        }else{
            
            self.backgroundColor = #colorLiteral(red: 0.06666666667, green: 0.09411764706, blue: 0.1098039216, alpha: 0.7177065497)
        }
        
        //self.dropShadow()
    }
    
}

struct dateModel{
    
    let day:String
    let date:String
    
}


