//
//  SectionTableViewCell.swift
//  MobilRemake
//
//  Created by Admin on 16/12/2016.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelCons: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 6.0
        label.layer.masksToBounds = true
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.gray.cgColor
        
        //label.frame.size.width = label.intrinsicContentSize.width + 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
