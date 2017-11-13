//
//  KullaniciKapaliHelper.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import ObjectMapper

public class KullaniciKapaliHelper: Mappable{
    var id_token : String = ""
    var access_token : String = ""
    var token_type : String = ""
    var expires_in : String = ""
    var scope : String = ""
    var state : String = ""
    var session_state : String = ""
    var kullanici_ozel : KullaniciHelper? = KullaniciHelper()!
    
    var Kullanici_ozelFunc : KullaniciHelper {
        get {
            return kullanici_ozel!
        }
        set {
            self.kullanici_ozel = newValue
        }
    }
    
    var id_tokenFunc : String {
        get {
            return id_token
        }
        set {
            self.id_token = newValue
        }
    }
    
    var access_tokenFunc : String {
        get {
            return access_token
        }
        set {
            self.access_token = newValue
        }
    }
    
    var token_typeFunc : String {
        get {
            return token_type
        }
        set {
            self.token_type = newValue
        }
    }
    
    var expires_inFunc : String {
        get {
            return expires_in
        }
        set {
            self.expires_in = newValue
        }
    }
    
    var scopeFunc : String {
        get {
            return scope
        }
        set {
            self.scope = newValue
        }
    }
    
    var stateFunc : String {
        get {
            return state
        }
        set {
            self.state = newValue
        }
    }
    
    var session_stateFunc : String {
        get {
            return session_state
        }
        set {
            self.session_state = newValue
        }
    }
    
    required public init?() {
    }
    required public init?(map: Map) {
    }
    public func mapping(map: Map) {
        id_tokenFunc <- map["id_token"]
        access_tokenFunc <- map["access_token"]
        token_typeFunc <- map["token_type"]
        expires_inFunc <- map["expires_in"]
        scopeFunc <- map["scope"]
        stateFunc <- map["state"]
        session_stateFunc <- map["session_state"]
        Kullanici_ozelFunc <- map["kullanici_ozel"]
    }
}

