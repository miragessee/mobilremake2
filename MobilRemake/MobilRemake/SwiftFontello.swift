//
//  SwiftFontello.swift
//  MobilRemake
//
//  Created by Admin on 06/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit
import CoreText

// MARK: - Public

/// A SwiftFontello extension to UIFont.
public extension UIFont {
    
    /// Get a UIFont object of SwiftFontello.
    ///
    /// - parameter ofSize: The preferred font size.
    /// - returns: A UIFont object of SwiftFontello.
    public class func swiftFontello(ofSize fontSize: CGFloat) -> UIFont {
        let name = "fontello"
        if UIFont.fontNames(forFamilyName: name).isEmpty {
            FontLoader.loadFont(name)
        }
        
        return UIFont(name: name, size: fontSize)!
    }
}

/// A SwiftFontello extension to String.
public extension String {
    
    /// Get a Fontello icon string with the given icon name.
    ///
    /// - parameter name: The preferred icon name.
    /// - returns: A string that will appear as icon with Fontello.
    public static func fontFontelloIcon(name: SwiftFontello) -> String {
        return name.rawValue.substring(to: name.rawValue.characters.index(name.rawValue.startIndex, offsetBy: 1))
    }
    
    /// Get a Fontello icon string with the given CSS icon code. Icon code can be found here: http://fontello.com/
    ///
    /// - parameter code: The preferred icon name.
    /// - returns: A string that will appear as icon with Fontello.
    public static func fontFontelloIcon(code: String) -> String? {
        
        guard let name = self.fontFontello(code: code) else {
            return nil
        }
        
        return self.fontFontelloIcon(name: name)
    }
    
    /// Get a Fontello icon with the given CSS icon code. Icon code can be found here: http://fontello.com/
    ///
    /// - parameter code: The preferred icon name.
    /// - returns: An internal corresponding Fontello code.
    public static func fontFontello(code: String) -> SwiftFontello? {
        
        guard let raw = SwiftFontelloIcons[code], let icon = SwiftFontello(rawValue: raw) else {
            return nil
        }
        
        return icon
    }
}

/// A SwiftFontello extension to UIImage.
public extension UIImage {
    
    /// Get a Fontello image with the given icon name, text color, size and an optional background color.
    ///
    /// - parameter name: The preferred icon name.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A string that will appear as icon with Fontello
    public static func fontFontelloIcon(name: SwiftFontello, textColor: UIColor, size: CGSize, backgroundColor: UIColor = UIColor.clear) -> UIImage {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = NSTextAlignment.center
        
        let fontAspectRatio: CGFloat = 1.28571429
        
        let fontSize = min(size.width / fontAspectRatio, size.height)
        let attributedString = NSAttributedString(string: String.fontFontelloIcon(name: name), attributes: [NSFontAttributeName: UIFont.swiftFontello(ofSize: fontSize), NSForegroundColorAttributeName: textColor, NSBackgroundColorAttributeName: backgroundColor, NSParagraphStyleAttributeName: paragraph])
        UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
        attributedString.draw(in: CGRect(x: 0, y: (size.height - fontSize) / 2, width: size.width, height: fontSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    /// Get a Fontello image with the given icon css code, text color, size and an optional background color.
    ///
    /// - parameter code: The preferred icon css code.
    /// - parameter textColor: The text color.
    /// - parameter size: The image size.
    /// - parameter backgroundColor: The background color (optional).
    /// - returns: A string that will appear as icon with Fontello
    public static func fontFontelloIcon(code: String, textColor: UIColor, size: CGSize, backgroundColor: UIColor = UIColor.clear) -> UIImage? {
        guard let name = String.fontFontello(code: code) else { return nil }
        return fontFontelloIcon(name: name, textColor: textColor, size: size, backgroundColor: backgroundColor)
    }
}

// MARK: - Private

private class FontLoader {
    class func loadFont(_ name: String) {
        let bundle = Bundle(for: FontLoader.self)
        let identifier = bundle.bundleIdentifier
        
        var fontURL: URL
        if identifier?.hasPrefix("org.cocoapods") == true {
            // If this framework is added using CocoaPods, resources is placed under a subdirectory
            fontURL = bundle.url(forResource: name, withExtension: "ttf", subdirectory: "SwiftFontello.swift.bundle")!
        } else {
            fontURL = bundle.url(forResource: name, withExtension: "ttf")!
        }
        
        let data = try! Data(contentsOf: fontURL)
        
        let provider = CGDataProvider(data: data as CFData)
        let font = CGFont(provider!)
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
            NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
    }
}

