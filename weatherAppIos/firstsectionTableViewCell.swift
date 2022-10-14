//
//  firstsectionTableViewCell.swift
//  weatherAppIos
//
//  Created by CH 002 on 11/10/22.
//

import UIKit

class firstsectionTableViewCell: UITableViewCell {

    @IBOutlet weak var localTimeLabel: UILabel!
    
    @IBOutlet weak var locationNameLabel: UILabel!
  
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    

}
