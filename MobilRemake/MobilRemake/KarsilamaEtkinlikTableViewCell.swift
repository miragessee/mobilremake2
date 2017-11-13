//
//  KarsilamaEtkinlikTableViewCell.swift
//  MobilRemake
//
//  Created by Admin on 14/01/2017.
//  Copyright © 2017 miragessee. All rights reserved.
//

import UIKit

class KarsilamaEtkinlikTableViewCell: UITableViewCell {

    @IBOutlet weak var etkinlikAdi: UILabel!
    @IBOutlet weak var sagdakiSaatView: UIView!
    @IBOutlet weak var soldakiSaatView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        sagdakiSaatView.layer.masksToBounds = false
        sagdakiSaatView.layer.cornerRadius = 8.0
        sagdakiSaatView.clipsToBounds = true
        
        soldakiSaatView.layer.masksToBounds = false
        soldakiSaatView.layer.cornerRadius = 8.0
        soldakiSaatView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
