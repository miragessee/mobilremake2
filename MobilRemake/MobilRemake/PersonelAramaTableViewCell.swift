//
//  PersonelAramaTableViewCell.swift
//  MobilRemake
//
//  Created by Admin on 05/01/2017.
//  Copyright © 2017 miragessee. All rights reserved.
//

import UIKit

class PersonelAramaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fotoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        fotoImageView.layer.masksToBounds = false
        fotoImageView.layer.cornerRadius = fotoImageView.frame.height/2
        fotoImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
