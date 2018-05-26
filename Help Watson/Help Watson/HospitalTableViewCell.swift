//
//  HospitalTableViewCell.swift
//  Help Watson
//
//  Created by Sonera Tayub on 25/05/2018.
//  Copyright © 2018 helpWatson. All rights reserved.
//

import UIKit


class HospitalTableViewCell: UITableViewCell {
   
    //MAR: Properties
    @IBOutlet weak var rankLabel: UILabel?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var addressLabel: UILabel?
    @IBOutlet weak var treatmentLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
