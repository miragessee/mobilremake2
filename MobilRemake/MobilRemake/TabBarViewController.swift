//
//  TabBarViewController.swift
//  MobilRemake
//
//  Created by Admin on 06/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit
import Toast_Swift

class TabBarViewController: UITabBarController , SlideMenuDelegate , UISearchBarDelegate{
    
    static var bas = 0
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    var filtreleViewController : UIViewController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        // Do any additional setup after loading the view.
        self.tabBar.items?[0].image = UIImage.fontFontelloIcon(name: SwiftFontello.FTLFeather, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
        self.tabBar.items?[1].image = UIImage.fontFontelloIcon(name: SwiftFontello.FTLMail1, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
        self.tabBar.items?[2].image = UIImage.fontFontelloIcon(name: SwiftFontello.FTLBuilding, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage(named: "")
        self.navigationController?.navigationBar.layer.borderWidth = 0
        
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        self.navigationController?.navigationBar.layer.borderColor =
            UIColor.orange.cgColor
        self.navigationController?.navigationBar.layer.borderWidth = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        // create a new style
        var style = ToastStyle()
        
        // this is just one of many style options
        style.messageColor = UIColor.white
        
        style.backgroundColor = UIColor.orange
        
        // present the toast with the new style
        self.view.makeToast(searchBar.text!, duration: 3.0, position: .bottom, style: style)
        
        // or perhaps you want to use this style for all toasts going forward?
        // just set the shared style and there's no need to provide the style again
        ToastManager.shared.style = style
        
        // toggle "tap to dismiss" functionality
        ToastManager.shared.tapToDismissEnabled = true
        
        // toggle queueing behavior
        ToastManager.shared.queueEnabled = true
    }
    
    func slideMenuItemSelectedAtIndex(_ index: Int32) {
        let topViewController : UIViewController = self.navigationController!.topViewController!
        print("View Controller is : \(topViewController) \n", terminator: "")
        switch(index){
        case 1:
            print("OnlineOdeme\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("OnlineOdemeViewController")
            
            break
        case 2:
            print("Iletisim\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("IletisimViewController")
            
            break
        case 3:
            print("Ayarlar\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("AyarlarViewController")
            
            break
        case 4:
            print("OturumuKapat\n", terminator: "")
            
            //self.openViewControllerBasedOnIdentifier("OturumuKapatViewController")
            
            break
        default:
            print("default\n", terminator: "")
        }
    }
    
    func openViewControllerBasedOnIdentifier(_ strIdentifier:String){
        let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: strIdentifier)
        
        /*let topViewController : UIViewController = self.navigationController!.topViewController!
         
         if (topViewController.restorationIdentifier! == destViewController.restorationIdentifier!){
         print("Same VC")
         } else {
         self.navigationController!.pushViewController(destViewController, animated: true)
         }*/
        ///self.present(destViewController, animated:true, completion:nil)
        self.navigationController!.pushViewController(destViewController, animated: true)
    }
    
    func addSlideMenuButton(){
        let btnShowMenu = UIButton(type: UIButtonType.system)
        btnShowMenu.setImage(self.defaultMenuImage(), for: UIControlState())
        btnShowMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnShowMenu.addTarget(self, action: #selector(BaseViewController.onSlideMenuButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        self.navigationItem.leftBarButtonItem = customBarItem;
    }
    
    func defaultMenuImage() -> UIImage {
        var defaultMenuImage = UIImage()
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 22), false, 0.0)
        
        UIColor.black.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 3, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 10, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 17, width: 30, height: 1)).fill()
        
        UIColor.white.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 4, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 11,  width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 18, width: 30, height: 1)).fill()
        
        defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return defaultMenuImage;
    }
    
    func onSlideMenuButtonPressed(_ sender : UIButton){
        if (sender.tag == 10 || BaseViewController.isOpen)
        {
            self.navigationController?.navigationBar.isHidden = false
            BaseViewController.isOpen=false
            // To Hide Menu If it already there
            self.slideMenuItemSelectedAtIndex(-1);
            
            sender.tag = 0;
            
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                viewMenuBack.removeFromSuperview()
            })
            
            return
        }
        
        if !BaseViewController.isOpen
        {
            self.navigationController?.navigationBar.isHidden = true
            BaseViewController.isOpen = true
            sender.isEnabled = false
            sender.tag = 10
            
            let menuVC : MenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
            menuVC.btnMenu = sender
            menuVC.delegate = self
            self.view.addSubview(menuVC.view)
            self.addChildViewController(menuVC)
            menuVC.view.layoutIfNeeded()
            
            
            menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
                sender.isEnabled = true
            }, completion:nil)
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
