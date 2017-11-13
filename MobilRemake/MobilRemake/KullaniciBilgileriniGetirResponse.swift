//
//  KullaniciBilgileriniGetirResponse.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit
import ObjectMapper

class KullaniciBilgileriniGetirResponse: Mappable {
    var KullaniciBilgileri:KullaniciBilgiModel?;
    var NotificationTurListesi = [NotificationTurModel]();
    
    required init?() {
    }
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        KullaniciBilgileri <- map["KullaniciBilgileri"]
        NotificationTurListesi <- map["NotificationTurListesi"]
    }
}
