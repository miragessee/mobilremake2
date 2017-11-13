//
//  HaberTableViewCell.swift
//  MobilRemake
//
//  Created by Sahin BICEN on 15.12.2016.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit
import ImageSlideshow

class HaberTableViewCell: UITableViewCell {

    @IBOutlet weak var cizgiSagGradientView: GradientView!
    @IBOutlet weak var cizgiSolGradientView: GradientView!
    @IBOutlet weak var ImgSlider: ImageSlideshow!
    @IBOutlet weak var ViewCizgi: UIView!
    @IBOutlet weak var LblTarih: UILabel!
    @IBOutlet weak var LblBegen: UILabel!
    @IBOutlet weak var LblBegenme: UILabel!
    @IBOutlet weak var LblPaylas: UILabel!
    @IBOutlet weak var ViewMarker: UIView!
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

        //http://w3.sdu.edu.tr/SDU_Files/Slider/26dcdc20-cf58-4198-94e9-d605d6633ad4.jpg
        
        ImgSlider.backgroundColor = UIColor.white
        ImgSlider.slideshowInterval = 5.0
        ImgSlider.pageControlPosition = PageControlPosition.insideScrollView
        ImgSlider.pageControl.currentPageIndicatorTintColor = UIColor.lightGray;
        ImgSlider.pageControl.pageIndicatorTintColor = UIColor.black;
        ImgSlider.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        //var kingfisherSource = [KingfisherSource(urlString: str2![0])!, KingfisherSource(urlString: str2![1])!]
        
        var kingfisherSource = [KingfisherSource(urlString: "http://i.sabah.com.tr/sbh/2015/07/28/650x344/1438013996791.jpg")!,KingfisherSource(urlString: "http://www.sehirlersavasi.com/ilce-resimleri/resimler/3328912isp1.jpg")!,KingfisherSource(urlString: "http://i.milliyet.com.tr/YeniAnaResim/2013/07/29/fft99_mf3489373.Jpeg")!,KingfisherSource(urlString: "http://anlatsin.com/media/university/sdu/sdu_cover.jpg")!]
        
        
        
        ImgSlider.setImageInputs(kingfisherSource)

        cizgiSagGradientView.colors = [.lightGray,HexStringToUIColor.hexStringToUIColor(hex: "f5f5f5")]
        
        cizgiSagGradientView.direction = .horizontal
        
        cizgiSolGradientView.colors = [HexStringToUIColor.hexStringToUIColor(hex: "f5f5f5"),.lightGray]
        
        cizgiSolGradientView.direction = .horizontal
        
        //let gradient: CAGradientLayer = Ortak.SoldanCiz(genislik: ViewCizgi.frame.size.width, yukseklik: ViewCizgi.frame.size.height)
        //ViewCizgi.layer.insertSublayer(gradient, at: 0)
        
        //let gradient2: CAGradientLayer = Ortak.SagdanCiz(genislik: ViewCizgi.frame.size.width, yukseklik: ViewCizgi.frame.size.height)
        //ViewCizgi.layer.insertSublayer(gradient2, at: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
