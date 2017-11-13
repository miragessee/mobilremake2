//
//  KullaniciHelper.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import ObjectMapper

public class KullaniciHelper :Mappable{
    var aud: String = ""
    var exp: Int = 0
    var kimlik_no: String = ""
    var email: String = ""
    var ad_soyad : String = ""
    var Durum: String = ""
    var IsObs: Bool = false
    var IsGolcuk: Bool = false
    var IsPersonel: Bool = false
    
    var durumFunc : String {
        get {
            return Durum
        }
        set {
            self.Durum = newValue
        }
    }
    
    var IsObsFunc : Bool {
        get {
            return IsObs
        }
        set {
            self.IsObs = newValue
        }
    }
    
    var IsGolcukFunc : Bool {
        get {
            return IsGolcuk
        }
        set {
            self.IsGolcuk = newValue
        }
    }
    
    var IsPersonelFunc : Bool {
        get {
            return IsPersonel
        }
        set {
            self.IsPersonel = newValue
        }
    }
    
    var Ad_SoyadFunc: String {
        get {
            return ad_soyad
        }
        set {
            self.ad_soyad = newValue
        }
    }
    
    var AudFunc : String {
        get {
            return aud
        }
        set {
            self.aud = newValue
        }
    }
    
    var ExpFunc : Int {
        get {
            return exp
        }
        set {
            self.exp = newValue
        }
    }
    
    var Kimlik_noFunc : String {
        get {
            return kimlik_no
        }
        set {
            self.kimlik_no = newValue
        }
    }
    
    var EmailFunc : String {
        get {
            return email
        }
        set {
            self.email = newValue
        }
    }
    
    required public init?() {
    }
    required public init?(map: Map) {
    }
    public func mapping(map: Map) {
        AudFunc <- map["aud"]
        ExpFunc <- map["exp"]
        Kimlik_noFunc <- map["r_kimlik_no"]
        EmailFunc <- map["r_email"]
        Ad_SoyadFunc <- map["ad_soyad"]
    }
}
