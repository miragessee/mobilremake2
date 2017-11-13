//
//  SharedPreferencesHelper.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class SharedPreferencesHelper<T> {
    
    public func KullaniciBilgisiniKaydet(_ gelen: T) {
        let userDefaults = UserDefaults.standard
        var str = JsonParser<KullaniciHelper>()!.ParsEt(gelen as! String)!
        userDefaults.set(str.toJSONString()!, forKey: "KullaniciBilgileri")
        userDefaults.synchronize()
    }
    
    public func KullaniciBilgileriniGetir() -> AnyObject {
        let userDefaults = UserDefaults.standard
        let yourVariable: AnyObject = UserDefaults.standard.object(forKey: "KullaniciBilgileri") as AnyObject
        print(yourVariable)
        return yourVariable
    }
}
