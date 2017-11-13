//
//  SwiftFontelloView.swift
//  MobilRemake
//
//  Created by Admin on 06/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

/// A view for Fontello icons.
@IBDesignable public class SwiftFontelloView : UIView {
    
    private var iconView = UILabel()
    
    @IBInspectable
    public var iconCode:String = "" {
        didSet{
            self.iconView.text = String.fontFontelloIcon(code: iconCode)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    override public func prepareForInterfaceBuilder() {
        setupViews()
    }
    
    /// Add a UILabel subview containing Fontello icon
    func setupViews() {
        // Fits icon in the view
        self.iconView.textAlignment = NSTextAlignment.center
        self.iconView.text = String.fontFontelloIcon(code: self.iconCode)
        self.iconView.textColor = self.tintColor
        self.addSubview(iconView)
    }
    
    override public func tintColorDidChange() {
        self.iconView.textColor = self.tintColor
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        self.iconView.font = UIFont.swiftFontello(ofSize: bounds.size.width < bounds.size.height ? bounds.size.width : bounds.size.height)
        self.iconView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: bounds.size.width, height: bounds.size.height))
    }
}
