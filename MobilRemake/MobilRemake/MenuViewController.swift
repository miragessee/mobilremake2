//
//  MenuViewController.swift
//  MobilRemake
//
//  Created by Admin on 06/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class MenuViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    @IBOutlet weak var tblMenuOptions: UITableView!
    
    /**
     *  Menu button which was tapped to display the menu
     */
    var btnMenu : UIButton!
    
    /**
     *  Delegate of the MenuVC
     */
    var delegate : SlideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMenuOptions.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        tblMenuOptions.layer.shadowColor = UIColor.black.cgColor
        tblMenuOptions.layer.shadowOffset = CGSize.zero
        tblMenuOptions.layer.shadowOpacity = 0.6
        tblMenuOptions.layer.shadowRadius = 50
        
        tblMenuOptions.separatorColor = UIColor( red: 153/255, green: 153/255, blue:0/255, alpha: 0 )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!) {
        if btnMenu != nil
        {
            BaseViewController.isOpen = false
            self.navigationController?.tabBarController?.tabBar.isHidden = false
            btnMenu.tag = 0
            
            if (self.delegate != nil) {
                var index = Int32(button.tag)
                if(button == self.btnCloseMenuOverlay){
                    index = -1
                }
                delegate?.slideMenuItemSelectedAtIndex(index)
            }
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
                self.view.layoutIfNeeded()
                self.view.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                self.navigationController?.navigationBar.isHidden = false
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
            })
        }
        else
        {
            BaseViewController.isOpen = false
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
                self.view.layoutIfNeeded()
                self.view.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                self.navigationController?.navigationBar.isHidden = false
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
            })
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0
        {
            let cell = Bundle.main.loadNibNamed("HeaderTableViewCell", owner: self, options: nil)?.first as! HeaderTableViewCell
            return cell
        }
        else if indexPath.row == 1
        {
            let cell = Bundle.main.loadNibNamed("OnlineOdemeTableViewCell", owner: self, options: nil)?.first as! OnlineOdemeTableViewCell
            return cell
        }
        else if indexPath.row == 2
        {
            let cell = Bundle.main.loadNibNamed("AkademikTakvimTableViewCell", owner: self, options: nil)?.first as! AkademikTakvimTableViewCell
            return cell
        }
        else if indexPath.row == 3
        {
            let cell = Bundle.main.loadNibNamed("PersonelSoldanTableViewCell", owner: self, options: nil)?.first as! PersonelSoldanTableViewCell
            return cell
        }
        else if indexPath.row == 4
        {
            let cell = Bundle.main.loadNibNamed("IletisimTableViewCell", owner: self, options: nil)?.first as! IletisimTableViewCell
            return cell
        }
        else if indexPath.row == 5
        {
            let cell = Bundle.main.loadNibNamed("AyarlarTableViewCell", owner: self, options: nil)?.first as! AyarlarTableViewCell
            return cell
        }
        else if indexPath.row == 6
        {
            let cell = Bundle.main.loadNibNamed("OturumuKapatTableViewCell", owner: self, options: nil)?.first as! OturumuKapatTableViewCell
            return cell
        }
        else if indexPath.row == 7
        {
            let cell = Bundle.main.loadNibNamed("GirisYapTableViewCell", owner: self, options: nil)?.first as! GirisYapTableViewCell
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.tag = indexPath.row
        if BaseViewController.isLeftSlideAction
        {
            delegate?.slideMenuItemSelectedAtIndex(Int32(indexPath.row))
            BaseViewController.isLeftSlideAction = false
        }
        self.onCloseMenuClick(btn)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            let cell = Bundle.main.loadNibNamed("HeaderTableViewCell", owner: self, options: nil)?.first as! HeaderTableViewCell
            return cell.contentView.frame.height
        }
        else if indexPath.row == 1
        {
            let cell = Bundle.main.loadNibNamed("OnlineOdemeTableViewCell", owner: self, options: nil)?.first as! OnlineOdemeTableViewCell
            return cell.contentView.frame.height
        }
        else if indexPath.row == 2
        {
            let cell = Bundle.main.loadNibNamed("AkademikTakvimTableViewCell", owner: self, options: nil)?.first as! AkademikTakvimTableViewCell
            return cell.contentView.frame.height
        }
        else if indexPath.row == 3
        {
            let cell = Bundle.main.loadNibNamed("PersonelSoldanTableViewCell", owner: self, options: nil)?.first as! PersonelSoldanTableViewCell
            return cell.contentView.frame.height
        }
        else if indexPath.row == 4
        {
            let cell = Bundle.main.loadNibNamed("IletisimTableViewCell", owner: self, options: nil)?.first as! IletisimTableViewCell
            return cell.contentView.frame.height
        }
        else if indexPath.row == 5
        {
            let cell = Bundle.main.loadNibNamed("AyarlarTableViewCell", owner: self, options: nil)?.first as! AyarlarTableViewCell
            return cell.contentView.frame.height
        }
        else if indexPath.row == 6
        {
            let cell = Bundle.main.loadNibNamed("OturumuKapatTableViewCell", owner: self, options: nil)?.first as! OturumuKapatTableViewCell
            return cell.contentView.frame.height
        }
        else if indexPath.row == 7
        {
            let cell = Bundle.main.loadNibNamed("GirisYapTableViewCell", owner: self, options: nil)?.first as! GirisYapTableViewCell
            return cell.contentView.frame.height
        }
        else
        {
            return 50
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
