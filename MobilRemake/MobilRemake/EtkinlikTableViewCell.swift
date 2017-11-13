//
//  EtkinlikTableViewCell.swift
//  MobilRemake
//
//  Created by Admin on 15/12/2016.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class EtkinlikTableViewCell: UITableViewCell {

    @IBOutlet weak var ViewMarker: UIView!
    @IBOutlet weak var LblTarih: UILabel!
    @IBOutlet weak var LblBegen: UILabel!
    @IBOutlet weak var LblBegenme: UILabel!
    @IBOutlet weak var LblPaylas: UILabel!
    @IBOutlet weak var cizgiSagGradientView: GradientView!
    @IBOutlet weak var cizgiSolGradientView: GradientView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        LblTarih.font = UIFont.swiftFontello(ofSize: 12)
        LblTarih.text = String.fontFontelloIcon(name: SwiftFontello.FTLClock)
        ViewMarker.layer.cornerRadius = ViewMarker.frame.width/2
        ViewMarker.layer.masksToBounds = true
        LblBegen.font = UIFont.swiftFontello(ofSize: 17)
        LblBegen.text = String.fontFontelloIcon(name: SwiftFontello.FTLThumbsUp)
        LblBegenme.font = UIFont.swiftFontello(ofSize: 17)
        LblBegenme.text = String.fontFontelloIcon(name: SwiftFontello.FTLThumbsDown)
        LblPaylas.font = UIFont.swiftFontello(ofSize: 17)
        LblPaylas.text = String.fontFontelloIcon(name: SwiftFontello.FTLShare1)
        
        cizgiSagGradientView.colors = [.lightGray,HexStringToUIColor.hexStringToUIColor(hex: "f5f5f5")]
        
        cizgiSagGradientView.direction = .horizontal
        
        cizgiSolGradientView.colors = [HexStringToUIColor.hexStringToUIColor(hex: "f5f5f5"),.lightGray]
        
        cizgiSolGradientView.direction = .horizontal
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
