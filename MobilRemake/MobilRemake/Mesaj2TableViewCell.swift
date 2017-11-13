//
//  Mesaj2TableViewCell.swift
//  MobilRemake
//
//  Created by Admin on 11/01/2017.
//  Copyright © 2017 miragessee. All rights reserved.
//

import UIKit

class Mesaj2TableViewCell: UITableViewCell {

    @IBOutlet weak var sayiView: UIView!
    @IBOutlet weak var sayiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        sayiView.layer.masksToBounds = false
        sayiView.layer.cornerRadius = sayiView.frame.height/2
        sayiView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
