//
//  BaseParameters.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit
import ObjectMapper

class BaseParameters: Mappable {
    var CihazTurId:Int? = 2
    var Key:String? = "21FD064F-26BC-4245-A106-B9D509C14962"
    var Key2:String? = "CA582351-D65C-4E22-B412-117D43045843"
    var Key3:String? = "53DAA78B-2990-4EF4-83A0-D3A8AB2E876F"
    var Key4:String? = "2D738F94-99E0-4E5D-AB03-92014709D2C5"

    required init?() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        CihazTurId <- map["CihazTurId"]
        Key <- map["Key"]
        Key2 <- map["Key2"]
        Key3 <- map["Key3"]
        Key4 <- map["Key4"]
    }
}
