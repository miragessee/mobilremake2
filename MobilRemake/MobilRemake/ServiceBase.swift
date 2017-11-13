//
//  ServiceBase.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit
import ObjectMapper

class ServiceBase {
    func RequestPost(url:String,parameters:NSData,listenerError:IOnTCServiceError,listenerParser:IOnTCJsonParser,accessToken:String){
        
        let url = NSURL(string: url+"json")!
        let request = NSMutableURLRequest(url: url as URL);
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        
        request.httpBody=parameters as Data;
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){ data, response, error in
            if error != nil{
                listenerError.onTaskCompletedError(error! as AnyObject)
                print("Error -> \(error)")
                return
            }
            
            let res = response as! HTTPURLResponse
            
            var shared = SharedPreferencesHelper<Any>().KullaniciBilgileriniGetir()
            var kayitli = JsonParser<KullaniciHelper>()!.ParsEt(shared as! String)!
            
            let tarih = NSDate()
            
            let gecerlilikTarihi = NSDate(timeIntervalSince1970: TimeInterval(kayitli.ExpFunc))
            
            let suankiTarih = tarih.timeIntervalSince1970
            
            if (gecerlilikTarihi.timeIntervalSince1970 < suankiTarih)
            {
                print("bitti")
                listenerError.onTaskCompletedError("bitti" as AnyObject)
            }
            
            if (res.statusCode == 401 || res.statusCode == 404)
            {
                print("StatusCode -> \(res.statusCode)")
                listenerError.onTaskCompletedError(res.statusCode as AnyObject)
            }
            else
            {
                listenerParser.onTaskCompletedJsonParser(data! as AnyObject)
                
                print("Result -> \(data)")
            }
            
        }
        
        task.resume()
    }
    
    func RequestGet(url:String,parameters:AnyObject,listenerError:IOnTCServiceError,listenerParser:IOnTCJsonParser,accessToken:String){
        
    }
    func RequestPut(url:String,parameters:AnyObject,listenerError:IOnTCServiceError,listenerParser:IOnTCJsonParser,accessToken:String){
    }
}

