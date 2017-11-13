//
//  Ortak.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

public class Ortak {
    
    public static func TokenCozGetir (token: String) -> KullaniciHelper
    {
        do {
            var token = token.replacingOccurrences(of: ".", with: "-")
            var parts = token.components(separatedBy: "-")
            var ss = String()
            if parts[1].characters.count == 451
            {
                parts[1].append("=")
            }
            else
            {
                parts[1].append("==")
            }
            
            if let decodedData = NSData(base64Encoded: parts[1] as String, options:NSData.Base64DecodingOptions(rawValue: 0)),
                let decodedString = NSString(data: decodedData as Data, encoding: String.Encoding.utf8.rawValue) {
                ss = decodedString as String
            }
            var sss = String()
            sss = ss
            return JsonParser<KullaniciHelper>()!.ParsEt(sss)!
        }
        catch {
            var null : KullaniciHelper? = nil
            return null!
        }
    }
    public static func SoldanCiz(genislik:CGFloat,yukseklik:CGFloat)->CAGradientLayer
    {
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor.gray.cgColor, UIColor.darkGray.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.3)
        gradient.endPoint = CGPoint(x: 0.5, y: 0.3)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: genislik/2, height: yukseklik)
        return gradient;
    }
    public static func SagdanCiz(genislik:CGFloat,yukseklik:CGFloat)->CAGradientLayer
    {
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor.darkGray.cgColor, UIColor.gray.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.3)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.3)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: genislik, height: yukseklik)

        return gradient;
    }
}
