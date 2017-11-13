//
//  DuyuruTableViewCell.swift
//  MobilRemake
//
//  Created by Admin on 15/12/2016.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class DuyuruTableViewCell: UITableViewCell {

    @IBOutlet weak var LblBegen: UILabel!
    @IBOutlet weak var LblBegenme: UILabel!
    @IBOutlet weak var LblPaylas: UILabel!
    @IBOutlet weak var LblTarih: UILabel!
    @IBOutlet weak var ViewMarker: UIView!
    @IBOutlet weak var cizgiSagGradientView: GradientView!
    @IBOutlet weak var cizgiSolGradientView: GradientView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ViewMarker.layer.cornerRadius = ViewMarker.frame.width/2
        ViewMarker.layer.masksToBounds = true
        LblBegen.font = UIFont.swiftFontello(ofSize: 17)
        LblBegen.text = String.fontFontelloIcon(name: SwiftFontello.FTLThumbsUp)
        LblBegenme.font = UIFont.swiftFontello(ofSize: 17)
        LblBegenme.text = String.fontFontelloIcon(name: SwiftFontello.FTLThumbsDown)
        LblPaylas.font = UIFont.swiftFontello(ofSize: 17)
        LblPaylas.text = String.fontFontelloIcon(name: SwiftFontello.FTLShare1)
        LblTarih.font = UIFont.swiftFontello(ofSize: 12)
        LblTarih.text = String.fontFontelloIcon(name: SwiftFontello.FTLClock)
        
        cizgiSagGradientView.colors = [.lightGray,HexStringToUIColor.hexStringToUIColor(hex: "f5f5f5")]
        
        cizgiSagGradientView.direction = .horizontal
        
        cizgiSolGradientView.colors = [HexStringToUIColor.hexStringToUIColor(hex: "f5f5f5"),.lightGray]
        
        cizgiSolGradientView.direction = .horizontal
        
        /*let gradient: CAGradientLayer = Ortak.SoldanCiz(genislik: cizgi.frame.size.width, yukseklik: cizgi.frame.size.height)
        cizgi.layer.insertSublayer(gradient, at: 0)
        
        let gradient2: CAGradientLayer = Ortak.SagdanCiz(genislik: cizgi.frame.size.width, yukseklik: cizgi.frame.size.height)
        cizgi.layer.insertSublayer(gradient2, at: 0)*/
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
