//
//  ServiceMessageModel.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit
import ObjectMapper

class ServiceMessageModel<T:Mappable>:Mappable {
    var Sonuc:Bool?;
    var Message:String?;
    var Tur:Int?;
    var Icerik:T?;
    
    required init?(map: Map) {
    }
    init?() {
    }
    
    func mapping(map: Map) {
        Sonuc <- map["Sonuc"]
        Message <- map["Message"]
        Tur <- map["Tur"]
        Icerik <- map["Icerik"]
    }
    
    func ParsEt(_ gelen: AnyObject) ->  ServiceMessageModel<T>? {
        do{
            let json=gelen as! Data;
            let result = try JSONSerialization.jsonObject(with: json, options: []);
            let sonuc = Mapper<ServiceMessageModel<T>>().map(JSON: result as! [String : Any])
            return sonuc!;
        }catch {
            return nil;
        }
    }
}
