//
//  NotObsTableViewCell.swift
//  MobilRemake
//
//  Created by Admin on 15/12/2016.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class NotObsTableViewCell: UITableViewCell {

    @IBOutlet weak var fotoArkasiView: UIView!
    @IBOutlet weak var ViewMarker: UIView!
    @IBOutlet weak var LblTarih: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ViewMarker.layer.cornerRadius = ViewMarker.frame.width/2
        ViewMarker.layer.masksToBounds = true
        LblTarih.font = UIFont.swiftFontello(ofSize: 12)
        LblTarih.text = String.fontFontelloIcon(name: SwiftFontello.FTLClock)
        
        fotoArkasiView.layer.masksToBounds = false
        fotoArkasiView.layer.cornerRadius = 8.0
        fotoArkasiView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
