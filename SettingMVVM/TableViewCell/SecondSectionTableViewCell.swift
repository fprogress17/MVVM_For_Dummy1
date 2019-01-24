//
//  FirstTableViewCell.swift
//  settingMVVM
//
//  Created by fprogress17 on 1/24/19.
//  Copyright © 2019 CLee All rights reserved.
//

import UIKit

class SecondSectionTableViewCell: UITableViewCell {

      static let reuseIdentifier = "secondSectionTableViewCell"
    
     var cellDelegate : CellDelegate?
    
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    @IBAction func actionToggleSwitch(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
