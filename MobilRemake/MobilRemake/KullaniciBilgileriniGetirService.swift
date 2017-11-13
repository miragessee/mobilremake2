//
//  KullaniciBilgileriniGetirService.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import Foundation
import ObjectMapper

class KullaniciBilgileriniGetirService: ServiceBase , IOnTCJsonParser {
    var ListenerSonuc:IKullaniciBilgileriniGetir;
    var ListenerError:IOnTCServiceError;
    
    init(listener:IKullaniciBilgileriniGetir,listenerServiceError:IOnTCServiceError) {
        ListenerSonuc = listener;
        ListenerError=listenerServiceError;
    }
    
    func ServiceGit(_ parameters:KullaniciBilgileriniGetirParameters) {
        let dataa:String!=Mapper().toJSONString( parameters, prettyPrint: true);
        let requestBodyData:Data=dataa.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!;
        print(requestBodyData)
        
        RequestPost(url: (EnumAdresler.TestWebApi.rawValue+EnumMethodlar.KullaniciBilgileriniGetir.rawValue), parameters: requestBodyData as NSData, listenerError: ListenerError, listenerParser: self, accessToken: ViewController.accessTokenx)
    }
    
    func onTaskCompletedJsonParser(_ gelen: AnyObject
        ) {
        ListenerSonuc.onTaskCompletedKullaniciBilgileriniGetir(ServiceMessageModel<KullaniciBilgileriniGetirResponse>()!.ParsEt(gelen)!)
    }
}

