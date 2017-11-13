//
//  BirimlerViewController.swift
//  MobilRemake
//
//  Created by Admin on 10/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class BirimlerViewController: BaseViewController {
    
    @IBOutlet weak var boylamSagGradientView: GradientView!
    @IBOutlet weak var enlem2AltGradientView: GradientView!
    @IBOutlet weak var enlem1AltGradientView: GradientView!
    @IBOutlet weak var enlem2GradientView: GradientView!
    @IBOutlet weak var enlem1GradientView: GradientView!
    @IBOutlet weak var boylamGradientView: GradientView!
    @IBOutlet weak var aramaTextField: UITextField!
    @IBOutlet weak var lokasyonFoto: UIImageView!
    @IBOutlet weak var akademikView: UIView!
    @IBOutlet weak var fotokopiView: UIView!
    @IBOutlet weak var etkinlikView: UIView!
    @IBOutlet weak var idariView: UIView!
    @IBOutlet weak var kafeView: UIView!
    @IBOutlet weak var digerView: UIView!
    
    static var lokasyonFotoCenterY : CGFloat = -1
    static var akademikViewCenterY : CGFloat = -1
    static var fotokopiViewCenterY : CGFloat = -1
    static var etkinlikViewCenterY : CGFloat = -1
    static var idariViewCenterY : CGFloat = -1
    static var kafeViewCenterY : CGFloat = -1
    static var digerViewCenterY : CGFloat = -1
    static var boylamGradientViewCenterY : CGFloat = -1
    static var enlem1GradientViewCenterY : CGFloat = -1
    static var enlem2GradientViewCenterY : CGFloat = -1
    static var boylamSagGradientViewCenterY : CGFloat = -1
    static var enlem1AltGradientViewCenterY : CGFloat = -1
    static var enlem2AltGradientViewCenterY : CGFloat = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage(named: "")
        self.navigationController?.navigationBar.layer.borderWidth = 0
        
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        self.navigationController?.navigationBar.layer.borderColor =
            UIColor.orange.cgColor
        self.navigationController?.navigationBar.layer.borderWidth = 0
        
        /*akademikBirimlerIcon.font = UIFont.swiftFontello(ofSize: 35)
        akademikBirimlerIcon.text = String.fontFontelloIcon(name: SwiftFontello.FTLIndustrialBuilding)
        
        fotokopiKirtasiyeIcon.font = UIFont.swiftFontello(ofSize: 35)
        fotokopiKirtasiyeIcon.text = String.fontFontelloIcon(name: SwiftFontello.FTLPrint1)
        
        etkinlikAlanlariIcon.font = UIFont.swiftFontello(ofSize: 35)
        etkinlikAlanlariIcon.text = String.fontFontelloIcon(name: SwiftFontello.FTLDribbble)
        
        idariBirimlerIcon.font = UIFont.swiftFontello(ofSize: 35)
        idariBirimlerIcon.text = String.fontFontelloIcon(name: SwiftFontello.FTLCommericalBuilding)
        
        kafeRestorantIcon.font = UIFont.swiftFontello(ofSize: 35)
        kafeRestorantIcon.text = String.fontFontelloIcon(name: SwiftFontello.FTLCafe)
        
        digerIcon.font = UIFont.swiftFontello(ofSize: 35)
        digerIcon.text = String.fontFontelloIcon(name: SwiftFontello.FTLGlobe)*/
        
        aramaTextField.leftViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let image = UIImage.fontFontelloIcon(name: SwiftFontello.FTLSearch3, textColor: UIColor.lightGray, size: CGSize(width: 40, height: 40))
        imageView.image = image
        aramaTextField.leftView = imageView
        
        aramaTextField.layer.borderColor = HexStringToUIColor.hexStringToUIColor(hex: "eaeaea").cgColor
        aramaTextField.layer.borderWidth = 1.0
        
        self.tabBarController?.tabBar.isHidden = false
        
        if(BirimlerViewController.lokasyonFotoCenterY == -1)
        {
            BirimlerViewController.lokasyonFotoCenterY = self.lokasyonFoto.center.y
            BirimlerViewController.akademikViewCenterY = self.akademikView.center.y
            BirimlerViewController.fotokopiViewCenterY = self.fotokopiView.center.y
            BirimlerViewController.etkinlikViewCenterY = self.etkinlikView.center.y
            BirimlerViewController.idariViewCenterY = self.idariView.center.y
            BirimlerViewController.kafeViewCenterY = self.kafeView.center.y
            BirimlerViewController.digerViewCenterY = self.digerView.center.y
            BirimlerViewController.boylamGradientViewCenterY = self.boylamGradientView.center.y
            BirimlerViewController.enlem1GradientViewCenterY = self.enlem1GradientView.center.y
            BirimlerViewController.enlem2GradientViewCenterY = self.enlem2GradientView.center.y
            BirimlerViewController.boylamSagGradientViewCenterY = self.boylamSagGradientView.center.y
            BirimlerViewController.enlem1AltGradientViewCenterY = self.enlem1AltGradientView.center.y
            BirimlerViewController.enlem2AltGradientViewCenterY = self.enlem2AltGradientView.center.y
        }
        else
        {
            self.lokasyonFoto.center.y = BirimlerViewController.lokasyonFotoCenterY
            self.akademikView.center.y = BirimlerViewController.akademikViewCenterY
            self.fotokopiView.center.y = BirimlerViewController.fotokopiViewCenterY
            self.etkinlikView.center.y = BirimlerViewController.etkinlikViewCenterY
            self.idariView.center.y = BirimlerViewController.idariViewCenterY
            self.kafeView.center.y = BirimlerViewController.kafeViewCenterY
            self.digerView.center.y = BirimlerViewController.digerViewCenterY
            self.boylamGradientView.center.y = BirimlerViewController.boylamGradientViewCenterY
            self.enlem1GradientView.center.y = BirimlerViewController.enlem1GradientViewCenterY
            self.enlem2GradientView.center.y = BirimlerViewController.enlem2GradientViewCenterY
            self.boylamSagGradientView.center.y = BirimlerViewController.boylamSagGradientViewCenterY
            self.enlem1AltGradientView.center.y = BirimlerViewController.enlem1AltGradientViewCenterY
            self.enlem2AltGradientView.center.y = BirimlerViewController.enlem2AltGradientViewCenterY
            self.aramaTextField.alpha = 1
        }
        
        /*cizgiSagGradientView.colors = [.lightGray, HexStringToUIColor.hexStringToUIColor(hex: "f5f5f5")]
        
        cizgiSagGradientView.direction = .horizontal*/
        
        boylamGradientView.colors = [.white, .lightGray]
        boylamGradientView.direction = .horizontal
        
        boylamSagGradientView.colors = [.lightGray, .white]
        boylamSagGradientView.direction = .horizontal
        
        enlem1GradientView.colors = [.white, .lightGray]
        enlem1GradientView.direction = .vertical
        
        enlem1AltGradientView.colors = [.lightGray, .white]
        enlem1AltGradientView.direction = .vertical
        
        enlem2AltGradientView.colors = [.lightGray, .white]
        enlem2AltGradientView.direction = .vertical
        
        enlem2GradientView.colors = [.white, .lightGray]
        enlem2GradientView.direction = .vertical
    }
    
    @IBAction func aramaTextViewTapAction(_ sender: Any) {
        print("bastim asdasd")
        UIView.animate(withDuration: 1, animations:
            {
                self.lokasyonFoto.center.y -= self.view.bounds.height
                self.akademikView.center.y += self.view.bounds.height
                self.fotokopiView.center.y += self.view.bounds.height
                self.etkinlikView.center.y += self.view.bounds.height
                self.idariView.center.y += self.view.bounds.height
                self.kafeView.center.y += self.view.bounds.height
                self.digerView.center.y += self.view.bounds.height
                self.boylamGradientView.center.y += self.view.bounds.height
                self.enlem1GradientView.center.y += self.view.bounds.height
                self.enlem2GradientView.center.y += self.view.bounds.height
                self.boylamSagGradientView.center.y += self.view.bounds.height
                self.enlem1AltGradientView.center.y += self.view.bounds.height
                self.enlem2AltGradientView.center.y += self.view.bounds.height
                self.aramaTextField.alpha = 0
        }) { (success:Bool) in
            print("bitti asdasd")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController : UIViewController = storyBoard.instantiateViewController(withIdentifier: "BirimAramaMapViewController")
            self.navigationController!.pushViewController(nextViewController, animated: true)
        }
    }
    
    @IBAction func akademikViewTapAction(_ sender: Any) {
        print("bastim asdasd")
        UIView.animate(withDuration: 1, animations:
            {
                self.lokasyonFoto.center.y -= self.view.bounds.height
                self.akademikView.center.y += self.view.bounds.height
                self.fotokopiView.center.y += self.view.bounds.height
                self.etkinlikView.center.y += self.view.bounds.height
                self.idariView.center.y += self.view.bounds.height
                self.kafeView.center.y += self.view.bounds.height
                self.digerView.center.y += self.view.bounds.height
                self.boylamGradientView.center.y += self.view.bounds.height
                self.enlem1GradientView.center.y += self.view.bounds.height
                self.enlem2GradientView.center.y += self.view.bounds.height
                self.boylamSagGradientView.center.y += self.view.bounds.height
                self.enlem1AltGradientView.center.y += self.view.bounds.height
                self.enlem2AltGradientView.center.y += self.view.bounds.height
                self.aramaTextField.alpha = 0
        }) { (success:Bool) in
            print("bitti asdasd")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController : UIViewController = storyBoard.instantiateViewController(withIdentifier: "BirimAramaMapViewController")
            self.navigationController!.pushViewController(nextViewController, animated: true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.navigationController?.topViewController != self {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                print("back button tapped")
                self.lokasyonFoto.center.y = BirimlerViewController.lokasyonFotoCenterY
                self.akademikView.center.y = BirimlerViewController.akademikViewCenterY
                self.fotokopiView.center.y = BirimlerViewController.fotokopiViewCenterY
                self.etkinlikView.center.y = BirimlerViewController.etkinlikViewCenterY
                self.idariView.center.y = BirimlerViewController.idariViewCenterY
                self.kafeView.center.y = BirimlerViewController.kafeViewCenterY
                self.digerView.center.y = BirimlerViewController.digerViewCenterY
                self.boylamGradientView.center.y = BirimlerViewController.boylamGradientViewCenterY
                self.enlem1GradientView.center.y = BirimlerViewController.enlem1GradientViewCenterY
                self.enlem2GradientView.center.y = BirimlerViewController.enlem2GradientViewCenterY
                self.boylamSagGradientView.center.y = BirimlerViewController.boylamSagGradientViewCenterY
                self.enlem1AltGradientView.center.y = BirimlerViewController.enlem1AltGradientViewCenterY
                self.enlem2AltGradientView.center.y = BirimlerViewController.enlem2AltGradientViewCenterY
                self.aramaTextField.alpha = 1
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
