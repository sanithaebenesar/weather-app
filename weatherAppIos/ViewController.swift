//
//  ViewController.swift
//  weatherAppIos
//
//  Created by CH 002 on 11/10/22.
//

import UIKit
import MapKit
import Foundation
class ViewController: UIViewController, secondsectionTableViewCellDelegate {

    @IBOutlet weak var searchTable: UITableView!
    
    var dataArray: [[String:Any]] = []
    var Index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTable.delegate = self
        searchTable.dataSource = self
        
    }
    
    /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if(segue.identifier == "firstCellToSec") {
     if let destination = segue.destination as? secViewController {
     destination.delegate = self
     }
     }
     }
     @objc func buttonTapped(_ sender:UIButton!){
     self.performSegue(withIdentifier: "firstCellToSec", sender: sender)
     }*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "firstCellToSec") {
            if let destination = segue.destination as? secViewController {
                destination.delegate = self
            }
        }
    }
    func plusButtonAction() {
        performSegue(withIdentifier: "firstCellToSec", sender: nil)
    }
    func celToFarenAction(index: Int) {
        Index = index
        searchTable.reloadData()
    }
    
}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return dataArray.count
        case 1 :
            return 1
            
        default :
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            
            let cell_1 = tableView.dequeueReusableCell(withIdentifier: "firstsectionTableViewCell", for: indexPath) as! firstsectionTableViewCell
            let data = dataArray[indexPath.row]
            if let location = data["location"] as? [String:Any], let place = location["name"] as? String {
                cell_1.locationNameLabel.text = place
            }
            
            switch (Index) {
            case 0 :
            if let temp = data["current"] as? [String:Any], let temp_c = temp["temp_c"] as? Double {
                cell_1.tempLabel.text = "\(temp_c)"
            }
    
            case 1:
            if let temp = data["current"] as? [String:Any], let temp_f = temp["temp_f"] as? Double {
                cell_1.tempLabel.text = "\(temp_f)"
            }
            default:
                print("unexpected")
               
            }
            
           
            if let day = data["location"] as? [String:Any], let updateTime = day["localtime" ] as? String  {
    
                let dateTime = updateTime
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm "

                if let time = dateFormatter.date(from: dateTime) {
                    dateFormatter.dateFormat = "HH:mm a"

                let exactTime = dateFormatter.string(from: time)
                    print(exactTime)
                    cell_1.localTimeLabel.text = "\(exactTime)"
                    
                    
                }
            }
            return cell_1
        }
        else {
            let cell_2 : secondsectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "secondsectionTableViewCell", for: indexPath) as! secondsectionTableViewCell
            /* cell_2.plusButton.addTarget(self, action: #selector(ViewController.buttonTapped(_:)), for: UIControl.Event.touchUpInside)*/
            cell_2.delegate = self
            
            cell_2.segmentedControl.selectedSegmentIndex = Index
            
            return cell_2
        }
}
    
}
extension ViewController : secViewControllerDelegate {
    func weatherUpdate(outputData: [String : Any]?)  {
            if let outputData = outputData {
                dataArray.append(outputData)
                searchTable.reloadData()
            }
    }
}





