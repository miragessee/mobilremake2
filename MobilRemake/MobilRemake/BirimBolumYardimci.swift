//
//  BirimBolumYardimci.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit
import ObjectMapper

class BirimBolumYardimci: Mappable {
    var BirimAdi:String?;
    var BolumAdi:String?;
    var KisiNo:String?;
    var IsObs:Bool?;
    var IsGolcuk:Bool?;
    var IsPersonel:Bool?;
    
    required init?() {
    }
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        BirimAdi <- map["BirimAdi"]
        BolumAdi <- map["BolumAdi"]
        KisiNo <- map["KisiNo"]
        IsObs <- map["IsObs"]
        IsGolcuk <- map["IsGolcuk"]
        IsPersonel <- map["IsPersonel"]
    }
}
