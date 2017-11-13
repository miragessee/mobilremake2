//
//  BildirimTurleriTableViewCell.swift
//  MobilRemake
//
//  Created by Admin on 09/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class BildirimTurleriTableViewCell: UITableViewCell {

    @IBOutlet weak var bildirimSwitch: UISwitch!
    @IBOutlet weak var bildirimTurAdi: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
