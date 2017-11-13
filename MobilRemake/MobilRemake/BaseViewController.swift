//
//  BaseViewController.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,IOnTCServiceError, SlideMenuDelegate {

    static var isOpen : Bool = false
    static var isLeftSlideAction : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onTaskCompletedError(_ gelen: AnyObject) {
        print(gelen);
        DispatchQueue.main.async {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Login")
            self.present(nextViewController, animated:true, completion:nil)
        }
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
            print("Takvim\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("AkademikTakvimViewController")
            
            break
        case 3:
            print("Iletisim\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("PersonelAramaViewController")
            
            break
        case 4:
            print("Iletisim\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("IletisimViewController")
            
            break
        case 5:
            print("Ayarlar\n", terminator: "")
            
            self.openViewControllerBasedOnIdentifier("AyarlarViewController")
            
            break
        case 6:
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
         } else {*/
        destViewController.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(destViewController, animated: true)
        //}
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
