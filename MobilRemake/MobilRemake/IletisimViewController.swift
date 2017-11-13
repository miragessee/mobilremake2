//
//  IletisimViewController.swift
//  MobilRemake
//
//  Created by Admin on 06/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit
import Toast_Swift

class IletisimViewController: UIViewController , UITextViewDelegate, UITextFieldDelegate{

    @IBOutlet weak var konu: UITextField!
    @IBOutlet weak var mesaj: UITextView!
    @IBOutlet weak var gonder: UIButton!
    @IBOutlet weak var iptal: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addSlideMenuButton()
        // Do any additional setup after loading the view.
        mesaj.delegate = self
        konu.delegate = self
        
        konu.leftViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage.fontFontelloIcon(name: SwiftFontello.FTLTag4, textColor: UIColor.lightGray, size: CGSize(width: 20, height: 20))
        imageView.image = image
        konu.leftView = imageView
        
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image2 = UIImage.fontFontelloIcon(name: SwiftFontello.FTLDocText, textColor: UIColor.lightGray, size: CGSize(width: 20, height: 20))
        imageView2.image = image2
        
        let textAttachment = NSTextAttachment()
        textAttachment.image = image2
        var attrStringWithImage = NSAttributedString(attachment: textAttachment)
        var attributedString = NSMutableAttributedString(string: "Mesaj")
        attributedString.insert(attrStringWithImage, at: 0)
        mesaj.attributedText = attributedString
        mesaj.textColor = UIColor.lightGray
        
        gonder.backgroundColor = HexStringToUIColor.hexStringToUIColor(hex: "#56BC8A")
        iptal.backgroundColor = HexStringToUIColor.hexStringToUIColor(hex: "#D95E40")
        
        self.addDoneButtonOnKeyboard()
        
        //self.tabBarController?.tabBar.isHidden = true
        //self.hidesBottomBarWhenPushed = false
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Bitti", style: UIBarButtonItemStyle.done, target: self, action: #selector(IletisimViewController.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.mesaj.inputAccessoryView = doneToolbar
    }
    
    func doneButtonAction() {
        self.mesaj.resignFirstResponder()
    }
    
    func textViewDidBeginEditing(_ mesaj: UITextView) {
        if mesaj.textColor == UIColor.lightGray
        {
            mesaj.text = nil
            mesaj.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ mesaj: UITextView) {
        if mesaj.text.isEmpty
        {
            let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            let image2 = UIImage.fontFontelloIcon(name: SwiftFontello.FTLDocText, textColor: UIColor.lightGray, size: CGSize(width: 20, height: 20))
            imageView2.image = image2
            
            let textAttachment = NSTextAttachment()
            textAttachment.image = image2
            var attrStringWithImage = NSAttributedString(attachment: textAttachment)
            var attributedString = NSMutableAttributedString(string: "Mesaj")
            attributedString.insert(attrStringWithImage, at: 0)
            mesaj.attributedText = attributedString
            mesaj.textColor = UIColor.lightGray
        }
    }
    
    func textFieldShouldReturn(_ konu: UITextField) -> Bool {
        konu.resignFirstResponder()
        return true
    }

    @IBAction func gonderAction(_ sender: Any) {
        if (konu.text!.isEmpty || mesaj.text.isEmpty)
        {
            // create a new style
            var style = ToastStyle()
        
            // this is just one of many style options
            style.messageColor = UIColor.white
        
            style.backgroundColor = UIColor.orange
        
            // present the toast with the new style
            self.view.makeToast("Konu ve Mesaj boş bırakılamaz.", duration: 3.0, position: .bottom, style: style)
        
            // or perhaps you want to use this style for all toasts going forward?
            // just set the shared style and there's no need to provide the style again
            ToastManager.shared.style = style
        
            // toggle "tap to dismiss" functionality
            ToastManager.shared.tapToDismissEnabled = true
        
            // toggle queueing behavior
            ToastManager.shared.queueEnabled = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        
        self.tabBarController?.tabBar.isHidden = true
    }*/
    
    /*override func viewDidLayoutSubviews() {
        self.tabBarController?.tabBar.isHidden = true
    }*/
    
    /*override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        
        self.tabBarController?.tabBar.isHidden = true
    }*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }*/
 

}
