//
//  YemekTableViewCell.swift
//  MobilRemake
//
//  Created by Admin on 10/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit
import FaveButton

/*func color(_ rgbColor: Int) -> UIColor{
    return UIColor(
        red:   CGFloat((rgbColor & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbColor & 0x00FF00) >> 8 ) / 255.0,
        blue:  CGFloat((rgbColor & 0x0000FF) >> 0 ) / 255.0,
        alpha: CGFloat(1.0)
    )
}
*/

class YemekTableViewCell: UITableViewCell {

    @IBOutlet weak var begenmeFaveButton: FaveButton!
    @IBOutlet weak var likeFaveButton: FaveButton!
    @IBOutlet weak var ViewMarker: UIView!
    @IBOutlet weak var LblBegen: UILabel!
    @IBOutlet weak var LblBegenme: UILabel!
    @IBOutlet weak var LblPaylas: UILabel!
    @IBOutlet weak var cizgiSolGradientView: GradientView!
    @IBOutlet weak var cizgiSagGradientView: GradientView!
    @IBOutlet weak var LblBegenSayisi: UILabel!
    @IBOutlet weak var LblBegenmeSayisi: UILabel!
    @IBOutlet weak var BtnPaylas: UIButton!
    @IBOutlet weak var LblOgle: UILabel!
    @IBOutlet weak var LblAksam: UILabel!
    @IBOutlet weak var LblOgleOgun1: UILabel!
    @IBOutlet weak var LblOgleOgun2: UILabel!
    @IBOutlet weak var LblOgleOgun3: UILabel!
    @IBOutlet weak var LblOgleOgun4: UILabel!
    @IBOutlet weak var LblAksamOgun1: UILabel!
    @IBOutlet weak var LblAksamOgun2: UILabel!
    @IBOutlet weak var LblAksamOgun3: UILabel!
    @IBOutlet weak var LblAksamOgun4: UILabel!
    
    /*let colors = [
        DotColors(first: color(0x7DC2F4), second: color(0xE2264D)),
        DotColors(first: color(0xF8CC61), second: color(0x9BDFBA)),
        DotColors(first: color(0xAF90F4), second: color(0x90D1F9)),
        DotColors(first: color(0xE9A966), second: color(0xF8C852)),
        DotColors(first: color(0xF68FA7), second: color(0xF6A2B8))
    ]*/
    
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
        
        cizgiSagGradientView.colors = [.lightGray, HexStringToUIColor.hexStringToUIColor(hex: "f5f5f5")]
        
        cizgiSagGradientView.direction = .horizontal
        
        cizgiSolGradientView.colors = [HexStringToUIColor.hexStringToUIColor(hex: "f5f5f5"),.lightGray]
        
        cizgiSolGradientView.direction = .horizontal
        
        //cizgiGradientView.locations = [0.4, 1]
        
        /*let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.3)
        gradient.endPoint = CGPoint(x: 0.5, y: 0.3)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: cizgi.frame.size.width/2, height: cizgi.frame.size.height)
        
        cizgi.layer.insertSublayer(gradient, at: 0)
        
        let gradient2: CAGradientLayer = CAGradientLayer()
        
        gradient2.colors = [UIColor.black.cgColor, UIColor.white.cgColor]
        gradient2.locations = [0.0 , 1.0]
        gradient2.startPoint = CGPoint(x: 0.5, y: 0.3)
        gradient2.endPoint = CGPoint(x: 1.0, y: 0.3)
        gradient2.frame = CGRect(x: 0.0, y: 0.0, width: cizgi.frame.size.width, height: cizgi.frame.size.height)
        
        cizgi.layer.insertSublayer(gradient2, at: 0)*/
        //cizgi.layer.addSublayer(gradient)
        //cizgi.layer.addSublayer(gradient2)

        likeFaveButton.titleLabel?.font = UIFont.swiftFontello(ofSize: 17)
        likeFaveButton.setTitle(String.fontFontelloIcon(name: .FTLThumbsUp), for: .normal)
        
        begenmeFaveButton.titleLabel?.font = UIFont.swiftFontello(ofSize: 17)
        begenmeFaveButton.setTitle(String.fontFontelloIcon(name: .FTLThumbsDown), for: .normal)
        
        //likeFaveButton.imageView?.backgroundColor = HexStringToUIColor.hexStringToUIColor(hex: "f5f5f5")
        
        //likeFaveButton.imageView?.image?.draw(at: .zero, blendMode: .clear, alpha: 0)
        
        //likeFaveButton.imageView?.contentMode = UIViewContentMode.scaleToFill
        
        //cell.label.frame.size.width = cell.label.intrinsicContentSize.width + 10
        /*likeFaveButton.imageView?.frame.size.width = ((likeFaveButton.titleLabel?.intrinsicContentSize.width)! + 20)
        likeFaveButton.imageView?.frame.size.height = ((likeFaveButton.titleLabel?.intrinsicContentSize.height)! + 30)
        
        likeFaveButton.frame.size.width = ((likeFaveButton.titleLabel?.intrinsicContentSize.width)! + 20)
        likeFaveButton.frame.size.height = ((likeFaveButton.titleLabel?.intrinsicContentSize.height)! + 30)*/
    }
    
    /*func faveButton(_ faveButton: FaveButton, didSelected selected: Bool){
    }
    
    func faveButtonDotColors(_ faveButton: FaveButton) -> [DotColors]?{
        if( faveButton === likeFaveButton || faveButton === begenmeFaveButton){
            return colors
        }
        return nil
    }*/

    @IBAction func begenmeFavButtonAction(_ sender: Any) {
        if(likeFaveButton.currentTitleColor != UIColor.blue && begenmeFaveButton.currentTitleColor != UIColor.red)
        {
            print("qq")
            begenmeFaveButton.setTitleColor(UIColor.red, for: .normal)
            var a = Int(LblBegenmeSayisi.text!)! + 1
            LblBegenmeSayisi.text = String(a)
        }
            //else if (LblBegen.textColor.cgColor == HexStringToUIColor.hexStringToUIColor(hex: "ABABAB").cgColor)
        else if (likeFaveButton.currentTitleColor == UIColor.blue)
        {
            likeFaveButton.setTitleColor(HexStringToUIColor.hexStringToUIColor(hex: "ABABAB"), for: .normal)
            var a = Int(LblBegenSayisi.text!)! - 1
            LblBegenSayisi.text = String(a)
            
            begenmeFaveButton.setTitleColor(UIColor.red, for: .normal)
            var b = Int(LblBegenmeSayisi.text!)! + 1
            LblBegenmeSayisi.text = String(b)
        }
        else if (begenmeFaveButton.currentTitleColor == UIColor.red)
        {
            begenmeFaveButton.setTitleColor(HexStringToUIColor.hexStringToUIColor(hex: "ABABAB"), for: .normal)
            var b = Int(LblBegenmeSayisi.text!)! - 1
            LblBegenmeSayisi.text = String(b)
        }
    }
    
    @IBAction func begenFavButtonAction(_ sender: Any) {
        print("qweqe")
        
        //likeFaveButton.imageView?.image = nil
        
        //likeFaveButton.titleLabel?.textColor = UIColor.red
        
        if(likeFaveButton.currentTitleColor != UIColor.blue && begenmeFaveButton.currentTitleColor != UIColor.red)
        {
            print("asdasd")
            likeFaveButton.setTitleColor(UIColor.blue, for: .normal)
            var a = Int(LblBegenSayisi.text!)! + 1
            LblBegenSayisi.text = String(a)
        }
        else if (begenmeFaveButton.currentTitleColor == UIColor.red)
        {
            begenmeFaveButton.setTitleColor(HexStringToUIColor.hexStringToUIColor(hex: "ABABAB"), for: .normal)
            //LblBegenme.textColor = HexStringToUIColor.hexStringToUIColor(hex: "ABABAB")
            var a = Int(LblBegenmeSayisi.text!)! - 1
            LblBegenmeSayisi.text = String(a)
            
            likeFaveButton.setTitleColor(UIColor.blue, for: .normal)
            var b = Int(LblBegenSayisi.text!)! + 1
            LblBegenSayisi.text = String(b)
        }
        else if (likeFaveButton.currentTitleColor == UIColor.blue)
        {
            likeFaveButton.setTitleColor(HexStringToUIColor.hexStringToUIColor(hex: "ABABAB"), for: .normal)
            //LblBegenme.textColor = HexStringToUIColor.hexStringToUIColor(hex: "ABABAB")
            
            var b = Int(LblBegenSayisi.text!)! - 1
            LblBegenSayisi.text = String(b)
        }
    }
    
    @IBAction func begenAction(_ sender: Any) {
        if(LblBegen.textColor != UIColor.blue && LblBegenme.textColor != UIColor.red)
        {
            print("asdasd")
            LblBegen.textColor = UIColor.blue
            var a = Int(LblBegenSayisi.text!)! + 1
            LblBegenSayisi.text = String(a)
        }
        else if (LblBegenme.textColor == UIColor.red)
        {
            LblBegenme.textColor = HexStringToUIColor.hexStringToUIColor(hex: "ABABAB")
            var a = Int(LblBegenmeSayisi.text!)! - 1
            LblBegenmeSayisi.text = String(a)
            
            LblBegen.textColor = UIColor.blue
            var b = Int(LblBegenSayisi.text!)! + 1
            LblBegenSayisi.text = String(b)
        }
    }
    
    @IBAction func begenmeAction(_ sender: Any) {
        if(LblBegen.textColor != UIColor.blue && LblBegenme.textColor != UIColor.red)
        {
            print("qq")
            LblBegenme.textColor = UIColor.red
            var a = Int(LblBegenmeSayisi.text!)! + 1
            LblBegenmeSayisi.text = String(a)
        }
        //else if (LblBegen.textColor.cgColor == HexStringToUIColor.hexStringToUIColor(hex: "ABABAB").cgColor)
        else if (LblBegen.textColor == UIColor.blue)
        {
            LblBegen.textColor = HexStringToUIColor.hexStringToUIColor(hex: "ABABAB")
            var a = Int(LblBegenSayisi.text!)! - 1
            LblBegenSayisi.text = String(a)
            
            LblBegenme.textColor = UIColor.red
            var b = Int(LblBegenmeSayisi.text!)! + 1
            LblBegenmeSayisi.text = String(b)
        }
    }
    
    /*@IBAction func paylasAction(_ sender: Any) {
        // text to share
        let text = "This is some text that I want to share."
        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = AkisViewController().view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
        // present the view controller
        AkisViewController().present(activityViewController, animated: true, completion: nil)
    }*/
    
    /*@IBAction func begenTapAction(_ sender: Any) {
        print("asdasd")
        LblBegen.textColor = UIColor.blue
        var a = Int(LblBegenSayisi.text!)! + 1
        LblBegenSayisi.text = String(a)
    }*/
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
