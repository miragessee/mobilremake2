//
//  KullaniciBilgiModel.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit
import ObjectMapper

class KullaniciBilgiModel:Mappable{
    var AdSoyad:String?;
    var Durum:String?;
    var IsObs:Bool?;
    var IsGolcuk:Bool?;
    var IsPersonel:Bool?;
    var ObsList = [BirimBolumYardimci]();
    var GolcukList = [BirimBolumYardimci]();
    var PersonelList = [BirimBolumYardimci]();
    
    required init?() {
    }
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        AdSoyad <- map["AdSoyad"]
        Durum <- map["Durum"]
        IsObs <- map["IsObs"]
        IsGolcuk <- map["IsGolcuk"]
        IsPersonel <- map["IsPersonel"]
        ObsList <- map["ObsList"]
        GolcukList <- map["GolcukList"]
        PersonelList <- map["PersonelList"]
    }
}
