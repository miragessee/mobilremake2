//
//  JsonParser.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit
import ObjectMapper

class JsonParser<T:Mappable>:Mappable {
    
    required init?(map: Map) {
    }
    init?() {
    }
    
    func mapping(map: Map) {
    }
    
    func ParsEt(_ gelen: String) -> T? {
        do{
            let json=gelen.data(using: String.Encoding.utf8)
            let result = try JSONSerialization.jsonObject(with: json!, options: []);
            let sonuc=Mapper<T>().map(JSON: result as! [String : Any])
            return sonuc!;
        }catch {
            return nil;
        }
    }
}
