//
//  secondsectionTableViewCell.swift
//  weatherAppIos
//
//  Created by CH 002 on 11/10/22.
//
protocol secondsectionTableViewCellDelegate {
    func plusButtonAction()
    func celToFarenAction(index: Int)
}

import UIKit

class secondsectionTableViewCell: UITableViewCell {
    
    var delegate :secondsectionTableViewCellDelegate?
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func plusButtonAction(_ sender: Any) {
        delegate?.plusButtonAction()
    }
   
    
    
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        delegate?.celToFarenAction(index: sender.selectedSegmentIndex)
            
    }
    

    
}
