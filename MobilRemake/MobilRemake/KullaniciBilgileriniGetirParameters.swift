//
//  KullaniciBilgileriniGetirParameters.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import ObjectMapper

class KullaniciBilgileriniGetirParameters : BaseParameters {
    var CihazId:String?;
    
    required init?() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        CihazId <- map["CihazId"]
    }
}
