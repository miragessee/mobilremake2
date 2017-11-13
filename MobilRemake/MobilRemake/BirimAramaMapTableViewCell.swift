//
//  BirimAramaMapTableViewCell.swift
//  MobilRemake
//
//  Created by Admin on 11/01/2017.
//  Copyright © 2017 miragessee. All rights reserved.
//

import UIKit
import MapKit

class BirimAramaMapTableViewCell: UITableViewCell {
    
    @IBOutlet weak var solGradientView: GradientView!
    @IBOutlet weak var sagGradientView: GradientView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        sagGradientView.colors = [.clear,HexStringToUIColor.hexStringToUIColor(hex: "f5f5f5")]
        
        sagGradientView.direction = .horizontal
        
        solGradientView.colors = [HexStringToUIColor.hexStringToUIColor(hex: "f5f5f5"),.lightGray]
        
        solGradientView.direction = .horizontal
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func mapAction(_ sender: Any) {
        /*var URL = NSURL(string: "https://www.google.com.tr/maps/place/Garanti+S%C3%BCleyman+Demirel+%C3%9Cnv.+Paramati%C4%9Fi/@37.8292419,37.8292419,16z/data=!4m5!3m4!1s0x0:0xe37036620e8b0e62!8m2!3d37.8307143!4d30.5249789?hl=tr")
        UIApplication.shared.openURL(URL as! URL)*/
        /*if (UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://")! as URL)) {
         UIApplication.shared.openURL(NSURL(string:
         "comgooglemaps://?saddr=&daddr=\(37.8292419),\(30.5248505)&directionsmode=driving")! as URL)
         
         } else {
         NSLog("Can't use comgooglemaps://");
         openMapForPlace()
         }*/
        //https://www.google.com/maps/place/@37.8289826,30.5248814,18.25z/data=!4m5!3m4!1s0x0:0x6f99c4c409e21572!8m2!3d37.8289826!4d30.5248814
        
        /*if (UIApplication.shared.canOpenURL(NSURL(string:"https://maps.google.com")! as URL)) {
            UIApplication.shared.openURL(NSURL(string:
                "https://maps.google.com/?q=@\(37.8292836),\(30.5248663)")! as URL)
        } else {
            NSLog("Can't use comgooglemaps://");
            openMapForPlace()
        }*/
        
        if (UIApplication.shared.canOpenURL(NSURL(string:"https://maps.google.com")! as URL)) {
            UIApplication.shared.openURL(NSURL(string:
                "https://www.google.com/maps/place/@\(37.8289826),\(30.5248814),18.25z/data=!4m5!3m4!1s0x0:0x6f99c4c409e21572!8m2!3d\(37.8289826)!4d\(30.5248814)")! as URL)
        } else {
            NSLog("Can't use comgooglemaps://");
            openMapForPlace()
        }
        
        //var URL = NSURL(string:"http://maps.apple.com/?saddr=\(37.8292419),\(37.8292419)")!
        //UIApplication.shared.openURL(URL as! URL)
        /*// text to share
         let text = "https://www.google.com.tr/maps/@37.8292419,30.5248505,16z?hl=tr"
         
         // set up activity view controller
         let textToShare = [ text ]
         let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
         activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
         
         // exclude some activity types from the list (optional)
         activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
         
         // present the view controller
         self.present(activityViewController, animated: true, completion: nil)*/
    }
    
    @IBAction func denemeAction(_ sender: Any) {
        openMapForPlace()
    }
    
    func openMapForPlace() {
        
        let lat1 : NSString = "37.8289826"
        let lng1 : NSString = "30.5248814"
        
        let latitude:CLLocationDegrees =  lat1.doubleValue
        let longitude:CLLocationDegrees =  lng1.doubleValue
        
        let regionDistance:CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "\("Deneme")"
        mapItem.openInMaps(launchOptions: options)
        
    }
}
