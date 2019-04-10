//
//  ViewController.swift
//  TaskManager
//
//  Created by Jasmeet Kaur on 17/03/19.
//  Copyright © 2019 Jasmeet Kaur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var collectionView:UICollectionView!
    
    @IBOutlet weak var topView:UIView!
    @IBOutlet weak var taskAssignerView:UIImageView!
    @IBOutlet weak var veil:UIView!
    
    let circleView = UIView()
    var userViews:[UIImageView] = []
    
    var dateData:[dateModel] = [dateModel(day:"WED", date:"3"),dateModel(day:"THU", date:"4"),dateModel(day:"FRI", date:"5"),dateModel(day:"SAT", date:"6"),dateModel(day:"SUN", date:"7"),dateModel(day:"MON", date:"8"),dateModel(day:"TUE", date:"9")]
    
    
    var taskData:[taskModel] = [taskModel(circle:0,task:"Meeting with hotel Company",time:"Now",image:UIImage()),
                                taskModel(circle:0,task:"Test the App",time:"in an hour",image:UIImage()),
                                taskModel(circle:0,task:"Presentation with Directors",time:"in 2 hours",image:UIImage()),
                                taskModel(circle:0,task:"Call John",time:"in an hour",image:UIImage()),
                                taskModel(circle:0,task:"Buy some food",time:"in 5 hours",image:UIImage()),
                                taskModel(circle:0,task:"Go to Gym",time:"in 6 hours",image:UIImage()),taskModel(circle:0,task:"Eat healty",time:"in 7 hours",image:UIImage()),taskModel(circle:0,task:"Read book",time:"in 8 hours",image:UIImage()),taskModel(circle:0,task:"Go to  Sleep",time:"in 9 hours",image:UIImage())]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
       // tableView.backgroundColor = #293139
        
        self.collectionView.dropShadow()
        self.topView.dropShadow()
        
        configureTaskAssignerView()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func configureTaskAssignerView(){
        taskAssignerView.isHidden = true
        taskAssignerView.backgroundColor = #colorLiteral(red: 0.9847621145, green: 0.9087638506, blue: 0.2039215686, alpha: 1)
        taskAssignerView.layer.cornerRadius = UIConstants.smallCircleRadius/2
        taskAssignerView.image = UIImage(named: "grayCross")
        taskAssignerView.layer.masksToBounds = true
      
        
    
        
        let bigRadius = UIConstants.bigCircleTaskAssignerRadius
        let userRadius = UIConstants.userImageRadius
        let frame = taskAssignerView.frame
        let differencex:CGFloat = UIConstants.bigCircleTaskAssignerRadius/2 - UIConstants.smallCircleRadius/2
        circleView.frame.origin = CGPoint(x:frame.origin.x - differencex + 10, y:frame.origin.y-differencex-10)
        circleView.frame.size = CGSize(width:bigRadius,height:bigRadius)
        
        circleView.backgroundColor = .clear
        circleView.layer.cornerRadius = bigRadius/2
        circleView.layer.borderWidth = 3
        circleView.layer.borderColor = #colorLiteral(red: 0.9847621145, green: 0.9087638506, blue: 0.2039215686, alpha: 1)
        self.view.addSubview(circleView)
        circleView.isHidden = true
        
        for i in 1...4{
            let userview = UIImageView()
            userview.frame.size = CGSize(width:userRadius,height:userRadius)
            userview.frame.origin = CGPoint(x: frame.origin.x, y: frame.origin.y)
            let name = "user\(i)"
            userview.image = UIImage(named:name)
            userview.layer.cornerRadius = userRadius/2
            userview.layer.borderColor = #colorLiteral(red: 0.9847621145, green: 0.9087638506, blue: 0.2039215686, alpha: 1)
            userview.layer.borderWidth = 2.0
            userview.layer.masksToBounds = true
            userview.isHidden = true
            
            self.userViews.append(userview)
            self.view.addSubview(userview)
            
        }
        
        
        
        
    }
    
    func showTaskAssignerView(){
        taskAssignerView.isHidden = false
        for userview in userViews{
            
            userview.isHidden = false
            userview.alpha = 0
        }
        
        UIView.animate(withDuration: 0.6, delay: 0.2, options: .curveEaseOut, animations: {
            var taskFrame = self.taskAssignerView.frame
            taskFrame.origin.y -= 180
            
            self.taskAssignerView.frame = taskFrame
            //self.circleView.frame.origin.y -= 180
        }, completion: { finished in
            self.circleView.isHidden = false
            //self.animateBigCircleView()
            self.animateusers()
            print("!")
        })

        
        
    }

    
    func animateusers(){
        
        UIView.animate(withDuration :1.0, delay:0.1,options:.curveEaseOut,animations:{
            var i = 0
            self.circleView.alpha = 1.0
            for userview in self.userViews{
                i += 1
                userview.alpha = 1.0
                
                let bigRadius = UIConstants.bigCircleTaskAssignerRadius
                let userRadius = UIConstants.userImageRadius
                switch i{
                case 1:
                    userview.frame.origin = CGPoint(x: self.circleView.frame.origin.x-userRadius/2, y: self.circleView.frame.origin.y+bigRadius/2-userRadius/2)
                    //userview.image = UIImage(named: "user1")
                case 2:
                    userview.frame.origin = CGPoint(x:  self.circleView.frame.origin.x+bigRadius/2-userRadius/2, y:  self.circleView.frame.origin.y-userRadius/2)
                    //userview.image = UIImage(named: "user3")
                case 3:
                    userview.frame.origin = CGPoint(x:  self.circleView.frame.origin.x+bigRadius-userRadius/2, y:  self.circleView.frame.origin.y+bigRadius/2-userRadius/2)
                    //userview.image = UIImage(named: "user2")
                default:
                    userview.frame.origin = CGPoint(x:  self.circleView.frame.origin.x+bigRadius/2-userRadius/2, y:  self.circleView.frame.origin.y+bigRadius-userRadius/2-10)
                    //userview.image = UIImage(named: "user4")
                    
                }
                
            }
            
        },completion:{finised in
            
            
            //self.animateusers()
            
            
        })
        
        
    }
    
    
    

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TableViewCell
        
        cell.configure(with: taskData[indexPath.row])
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9847621145, green: 0.9087638506, blue: 0.2039215686, alpha: 1)
        cell.selectedBackgroundView = view
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        
        let cell:TableViewCell = tableView.cellForRow(at: indexPath) as! TableViewCell
        cell.circleView.backgroundColor = .red
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        
        if (indexPath != nil){
            let cell:TableViewCell = tableView.cellForRow(at: indexPath ?? IndexPath()) as! TableViewCell
        cell.circleView.backgroundColor = .yellow
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell:TableViewCell = tableView.cellForRow(at: indexPath) as! TableViewCell
       // cell.sideLine.backgroundColor = .gray
        cell.taskLabel.textColor = #colorLiteral(red: 0.2118692398, green: 0.2518185377, blue: 0.2881316543, alpha: 1)
         let borderLayer = cell.circleView.addExternalBorder(borderWidth: 2.0, borderColor: .black)
        cell.circleView.layer.addSublayer(borderLayer)
        cell.bringSubviewToFront(cell.circleView)
        //veil.isHidden = false
        showTaskAssignerView()
        
        for  nonSelCell in tableView.visibleCells{
            var nonselectedCell:TableViewCell = nonSelCell as! TableViewCell
            if nonselectedCell != cell{
                nonselectedCell.cellDisablerView.isHidden = false
                nonselectedCell.isUserInteractionEnabled = false
            }
        }
        
    
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
         let cell:TableViewCell = tableView.cellForRow(at: indexPath) as! TableViewCell
        cell.circleView.removeExternalBorders()
        cell.taskLabel.textColor = .white
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: title,
                                        handler: { (action, view, completionHandler) in
                                            // Update data source when user taps action
                                            //self.dataSource?.setFavorite(!favorite, at: indexPath)
                                            self.deleteTask(indexPath: indexPath)
                                            completionHandler(true)
        })
        let img = UIImage(named: "cross")
        
        action.image = img
        
        action.backgroundColor =  .red
        let configuration = UISwipeActionsConfiguration(actions: [action])
        return configuration
    }
    
    
    func deleteTask(indexPath:IndexPath){
        taskData.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
       // self.tableView.reloadData()
        
    }
    
    
    
}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCell", for: indexPath) as! CollectionViewCell
        cell.configure(with: dateData[indexPath.row],index:indexPath.row)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell : UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        cell.backgroundColor = #colorLiteral(red: 0.3843137255, green: 0.4588235294, blue: 0.5333333333, alpha: 0.7177065497)
        
        cell.dropShadow()
        //collectionView.reloadItems(at: [indexPath])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell : UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
        if (indexPath.row%2 == 0){
            cell.backgroundColor = #colorLiteral(red: 0.262745098, green: 0.2901960784, blue: 0.3254901961, alpha: 0.7177065497)
            
        }else{
            
            cell.backgroundColor = #colorLiteral(red: 0.06666666667, green: 0.09411764706, blue: 0.1098039216, alpha: 0.7177065497)
        }
    }

    
    
    
    
}


extension UIView {
    
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        self.layer.shadowPath = UIBezierPath(rect: bounds ).cgPath
            self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
  
        
        struct Constants {
            static let ExternalBorderName = "externalBorder"
        }
        
    func addExternalBorder(borderWidth: CGFloat = 2.0, borderColor: UIColor = UIColor.white) -> CALayer {
            let externalBorder = CALayer()
            externalBorder.frame = CGRect(x:-borderWidth,y:-borderWidth,width:frame.size.width + 2 * borderWidth,height:frame.size.height + 2 * borderWidth)
            externalBorder.borderColor = borderColor.cgColor
            externalBorder.borderWidth = borderWidth
            externalBorder.cornerRadius = (frame.size.width + 2 * borderWidth) / 2
            externalBorder.name = Constants.ExternalBorderName
            
        layer.insertSublayer(externalBorder, at: 0)
            layer.masksToBounds = false
            
            return externalBorder
        }
        
        func removeExternalBorders() {
            layer.sublayers?.filter() { $0.name == Constants.ExternalBorderName }.forEach() {
                $0.removeFromSuperlayer()
            }
        }
        
        func removeExternalBorder(externalBorder: CALayer) {
            guard externalBorder.name == Constants.ExternalBorderName else { return }
            externalBorder.removeFromSuperlayer()
        }
        
    

}
