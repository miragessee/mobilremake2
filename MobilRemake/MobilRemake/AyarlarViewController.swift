//
//  AyarlarViewController.swift
//  MobilRemake
//
//  Created by Admin on 06/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class AyarlarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var kisisellestirmeIcon: UILabel!
    /*@IBOutlet weak var bagliTableViewConstraint: NSLayoutConstraint!*/
    @IBOutlet weak var sapka: UILabel!
    @IBOutlet weak var zil: UILabel!
    @IBOutlet weak var bagliBirimlerTableView: UITableView!
    @IBOutlet weak var bildirimTurleriTableView: UITableView!
    
    var bildirimTurleriSayisi : Int = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addSlideMenuButton()
        // Do any additional setup after loading the view.
        sapka.font = UIFont.swiftFontello(ofSize: 22)
        sapka.text = String.fontFontelloIcon(name: SwiftFontello.FTLGraduationCap)
        zil.font = UIFont.swiftFontello(ofSize: 22)
        zil.text = String.fontFontelloIcon(name: SwiftFontello.FTLBell1)
        
        bagliBirimlerTableView.dataSource = self
        bagliBirimlerTableView.delegate = self
        
        bildirimTurleriTableView.dataSource = self
        bildirimTurleriTableView.delegate = self
        
        bagliBirimlerTableView.separatorColor = UIColor( red: 153/255, green: 153/255, blue:0/255, alpha: 0 )
        bildirimTurleriTableView.separatorColor = UIColor( red: 153/255, green: 153/255, blue:0/255, alpha: 0 )
        
        //self.tabBarController?.tabBar.isHidden = true
        /*self.bagliBirimlerTableView.estimatedRowHeight = 44.0 ;
        self.bagliBirimlerTableView.rowHeight = UITableViewAutomaticDimension;*/
        
        //self.bagliTableViewConstraint.constant = 4 * 45
        
        kisisellestirmeIcon.font = UIFont.swiftFontello(ofSize: 22)
        kisisellestirmeIcon.text = String.fontFontelloIcon(name: SwiftFontello.FTLUsers)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func viewDidLayoutSubviews(){
        bagliBirimlerTableView.frame = CGRect(x: bagliBirimlerTableView.frame.origin.x, y: bagliBirimlerTableView.frame.origin.y, width: bagliBirimlerTableView.frame.size.width, height: bagliBirimlerTableView.contentSize.height)
        bagliBirimlerTableView.reloadData()
        
        bildirimTurleriTableView.frame = CGRect(x: bildirimTurleriTableView.frame.origin.x, y: bildirimTurleriTableView.frame.origin.y, width: bagliBirimlerTableView.frame.size.width, height: bildirimTurleriTableView.contentSize.height)
        bildirimTurleriTableView.reloadData()
    }*/
    
    /*override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        
        self.tabBarController?.tabBar.isHidden = true
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        
        if tableView == self.bagliBirimlerTableView {
            count = 4
        }
        
        if tableView == self.bildirimTurleriTableView {
            count = bildirimTurleriSayisi
        }
        
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.bagliBirimlerTableView {
            if indexPath.row == 0
            {
                let cell = Bundle.main.loadNibNamed("BagliBirimlerTableViewCell", owner: self, options: nil)?.first as! BagliBirimlerTableViewCell
                cell.birimAdi.text = "BİLGİSAYAR MÜHENDİSLİĞİ (UZAKTAN EĞİTİM)"
                return cell
            }
            else if indexPath.row == 1
            {
                let cell = Bundle.main.loadNibNamed("BagliBirimlerTableViewCell", owner: self, options: nil)?.first as! BagliBirimlerTableViewCell
                cell.birimAdi.text = "DIŞ TİCARET"
                return cell
            }
            else if indexPath.row == 2
            {
                let cell = Bundle.main.loadNibNamed("BagliBirimlerTableViewCell", owner: self, options: nil)?.first as! BagliBirimlerTableViewCell
                cell.birimAdi.text = "BİLİŞİM TEKNOLOJİLERİ"
                return cell
            }
            else if indexPath.row == 3
            {
                let cell = Bundle.main.loadNibNamed("BagliBirimlerTableViewCell", owner: self, options: nil)?.first as! BagliBirimlerTableViewCell
                cell.birimAdi.text = "TURİZM VE OTEL İŞLETMECİLİĞİ"
                return cell
            }
        }
        
        if tableView == self.bildirimTurleriTableView {
            if indexPath.row == 0
            {
                let cell = Bundle.main.loadNibNamed("CheckBoxTableViewCell", owner: self, options: nil)?.first as! CheckBoxTableViewCell
                if cell.checkBox.isOn()
                {
                    bildirimTurleriSayisi = 1
                }
                return cell
            }
            else if indexPath.row == 1
            {
                let cell = Bundle.main.loadNibNamed("BildirimTurleriTableViewCell", owner: self, options: nil)?.first as! BildirimTurleriTableViewCell
                cell.bildirimTurAdi.text = "Haber"
                return cell
            }
            else if indexPath.row == 2
            {
                let cell = Bundle.main.loadNibNamed("BildirimTurleriTableViewCell", owner: self, options: nil)?.first as! BildirimTurleriTableViewCell
                cell.bildirimTurAdi.text = "Duyuru"
                return cell
            }
            else if indexPath.row == 3
            {
                let cell = Bundle.main.loadNibNamed("BildirimTurleriTableViewCell", owner: self, options: nil)?.first as! BildirimTurleriTableViewCell
                cell.bildirimTurAdi.text = "OBS"
                return cell
            }
            else if indexPath.row == 4
            {
                let cell = Bundle.main.loadNibNamed("BildirimTurleriTableViewCell", owner: self, options: nil)?.first as! BildirimTurleriTableViewCell
                cell.bildirimTurAdi.text = "Mesaj"
                return cell
            }
            else if indexPath.row == 5
            {
                let cell = Bundle.main.loadNibNamed("BildirimTurleriTableViewCell", owner: self, options: nil)?.first as! BildirimTurleriTableViewCell
                cell.bildirimTurAdi.text = "Yemekhane"
                return cell
            }
            else if indexPath.row == 6
            {
                let cell = Bundle.main.loadNibNamed("BildirimTurleriTableViewCell", owner: self, options: nil)?.first as! BildirimTurleriTableViewCell
                cell.bildirimTurAdi.text = "Etkinlik"
                return cell
            }
            else if indexPath.row == 7
            {
                let cell = Bundle.main.loadNibNamed("BildirimTurleriTableViewCell", owner: self, options: nil)?.first as! BildirimTurleriTableViewCell
                cell.bildirimTurAdi.text = "Hesap"
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    /*func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("did select:      \(indexPath.row)  ")
    }*/
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if tableView == self.bildirimTurleriTableView {
            print("did select:      \(indexPath.row)  ")
            if (indexPath.row == 0)
            {
                let cell = tableView.cellForRow(at: indexPath) as! CheckBoxTableViewCell
                /*cell.checkBox.checkboxValueChangedBlock = {
                    isOn in
                    if isOn
                    {
                        print("acik")
                        cell.checkBox.setOn(false, animated: true)
                    }
                    else
                    {
                        print("kapali")
                        cell.checkBox.setOn(true, animated: true)
                    }
                }*/
                if (cell.checkBox.isOn())
                {
                    CheckBoxTableViewCell.checkBoxDurumu = false
                    cell.checkBox.setOn(false, animated: true)
                    bildirimTurleriSayisi = 8
                    tableView.reloadData()
                }
                else
                {
                    CheckBoxTableViewCell.checkBoxDurumu = true
                    cell.checkBox.setOn(true, animated: true)
                    bildirimTurleriSayisi = 1
                    tableView.reloadData()
                }
            }
            else
            {
                let cell = tableView.cellForRow(at: indexPath) as! BildirimTurleriTableViewCell
                if (cell.bildirimSwitch.isOn)
                {
                    cell.bildirimSwitch.setOn(false, animated: true)
                }
                else
                {
                    cell.bildirimSwitch.setOn(true, animated: true)
                }
            }
            return indexPath
        }
        else
        {
            return indexPath
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.bildirimTurleriTableView {
            if indexPath.row == 0
            {
                let cell = Bundle.main.loadNibNamed("CheckBoxTableViewCell", owner: self, options: nil)?.first as! CheckBoxTableViewCell
                return cell.contentView.frame.height
            }
            else
            {
                let cell = Bundle.main.loadNibNamed("BildirimTurleriTableViewCell", owner: self, options: nil)?.first as! BildirimTurleriTableViewCell
                return cell.contentView.frame.height
            }
        }
        else
        {
            let cell = Bundle.main.loadNibNamed("BagliBirimlerTableViewCell", owner: self, options: nil)?.first as! BagliBirimlerTableViewCell
            return cell.contentView.frame.height
            //return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
