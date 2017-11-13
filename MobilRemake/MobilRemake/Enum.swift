//
//  Enum.swift
//  MobilRemake
//
//  Created by Admin on 06/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

public enum SwiftFontello: String {
    case FTLCloudFlashAlt = "\u{ed8f}"
    case FTLTag4 = "\u{ed25}"
    case FTLDocText = "\u{e88f}"
    case FTLFloppy = "\u{e950}"
    case FTLGraduationCap = "\u{e998}"
    case FTLBell1 = "\u{ea66}"
    case FTLFeather = "\u{ea60}"
    case FTLMail1 = "\u{ea2e}"
    case FTLBuilding = "\u{e989}"
    case FTLThumbsUp = "\u{e864}"
    case FTLShare1 = "\u{ea80}"
    case FTLThumbsDown = "\u{e865}"
    case FTLClock = "\u{e8b7}"
    case FTLIndustrialBuilding = "\u{ee53}"
    case FTLCommericalBuilding = "\u{ee43}"
    case FTLPrint1 = "\u{ea61}"
    case FTLCafe = "\u{ee3e}"
    case FTLDribbble = "\u{e9d5}"
    case FTLGlobe = "\u{e90b}"
    case FTLSearch3 = "\u{ec79}"
    case FTLMail = "\u{e825}"
    case FTLPhone1 = "\u{ea7d}"
    case FTLMap1 = "\u{ebaa}"
    case FTLChartPie = "\u{e94c}"
    case FTLMegaphone = "\u{e951}"
    case FTLStreetView = "\u{e9b1}"
    case FTLCancel = "\u{e842}"
    case FTLRightBold = "\u{eab2}"
    case FTLHomeOutline = "\u{eb75}"
    case FTLPrint3 = "\u{ed2e}"
    case FTLAddress = "\u{ea6a}"
    case FTLCoffee1 = "\u{ec4f}"
    case FTLGlobeAltOutline = "\u{ec19}"
    case FTLUsers = "\u{e831}"
    
    /// Get a Fontello string from the given CSS icon code. Icon code can be found here: http://fontello.com/
    ///
    /// - parameter code: The preferred icon name.
    /// - returns: Fontello icon.
    public static func fromCode(_ code: String) -> SwiftFontello? {
        guard let raw = SwiftFontelloIcons[code], let icon = SwiftFontello(rawValue: raw) else {
            return nil
        }
        return icon
    }
}

/// An array of Fontello icon codes.
public let SwiftFontelloIcons = [
    "icon-cloud-flash": "\u{ed8f}",
    "FTLTag4" : "\u{ed25}",
    "FTLDocText" : "\u{e88f}",
    "FTLFloppy" : "\u{e950}",
    "FTLGraduationCap" : "\u{e998}",
    "FTLBell" : "\u{e881}",
    "FTLFeather" : "\u{ea60}",
    "FTLMail1" : "\u{ea2e}",
    "FTLBuilding" : "\u{e989}",
    "FTLThumbsUp" : "\u{e864}",
    "FTLShare1" : "\u{ea80}",
    "FTLThumbsDown" : "\u{e865}",
    "FTLClock" : "\u{e8b7}",
    "FTLMail" : "\u{e825}",
    "FTLPhone1" : "\u{ea7d}",
    "FTLMap1" : "\u{ebaa}",
    "FTLChartPie" : "\u{e94c}",
    "FTLMegaphone" : "\u{e951}",
    "FTLStreetView" : "\u{e9b1}",
    "FTLCancel" : "\u{e842}",
    "FTLRightBold" : "\u{eab2}",
    "FTLHomeOutline" : "\u{eb75}",
    "FTLPrint3" : "\u{ed2e}",
    "FTLAddress" : "\u{ea6a}",
    "FTLCoffee1" : "\u{ec4f}",
    "FTLGlobeAltOutline" : "\u{ec19}",
    "FTLUsers" : "\u{e831}"
]
