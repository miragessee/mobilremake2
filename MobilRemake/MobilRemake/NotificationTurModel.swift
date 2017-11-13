//
//  NotificationTurModel.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit
import ObjectMapper

class NotificationTurModel: Mappable {
    var TurId:Int?;
    var TurAdi:String?;
    var RenkKodu:String?;
    var IsObs:Bool?;
    var IsGolcuk:Bool?;
    var IsPersonel:Bool?;
    var IsGenel:Bool?;
    var IsSecili:Bool?;
    
    required init?() {
    }
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        TurId <- map["TurId"]
        TurAdi <- map["TurAdi"]
        RenkKodu <- map["RenkKodu"]
        IsObs <- map["IsObs"]
        IsGolcuk <- map["IsGolcuk"]
        IsPersonel <- map["IsPersonel"]
        IsGenel <- map["IsGenel"]
        IsSecili <- map["IsSecili"]
    }
}
