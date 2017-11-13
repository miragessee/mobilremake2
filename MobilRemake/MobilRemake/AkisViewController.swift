//
//  AkisViewController.swift
//  MobilRemake
//
//  Created by Admin on 14/12/2016.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit
import DGElasticPullToRefresh

class AkisViewController: BaseViewController , UIGestureRecognizerDelegate , UISearchBarDelegate{
    
    @IBOutlet weak var tableView: UITableView!

    static var bas = 0
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    var blurWebViewEffectController : UIViewController = UIViewController()
    var filtreleViewController : UIViewController = UIViewController()
    
    static var yemekPaslasText : String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.separatorColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 231/255.0, alpha: 1.0)
        tableView.backgroundColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 251/255.0, alpha: 1.0)
        view.addSubview(tableView)
        
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        //loadingView.tintColor = UIColor(red: 78/255.0, green: 221/255.0, blue: 200/255.0, alpha: 1.0)
        loadingView.tintColor = HexStringToUIColor.hexStringToUIColor(hex: "#142E3C")
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(1.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                self?.tableView.dg_stopLoading()
            })
            }, loadingView: loadingView)
        //tableView.dg_setPullToRefreshFillColor(UIColor(red: 57/255.0, green: 67/255.0, blue: 89/255.0, alpha: 1.0))
        tableView.dg_setPullToRefreshFillColor(UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0))
        //tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
        tableView.dg_setPullToRefreshBackgroundColor(UIColor.white)
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress(_:)))
        longPressGesture.minimumPressDuration = 0.3 // 1 second press
        longPressGesture.delegate = self
        self.tableView.addGestureRecognizer(longPressGesture)
        
        self.tableView.separatorColor = UIColor( red: 153/255, green: 153/255, blue:0/255, alpha: 0 )
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage(named: "")
        self.navigationController?.navigationBar.layer.borderWidth = 0
        
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        self.navigationController?.navigationBar.layer.borderColor =
            UIColor.orange.cgColor
        self.navigationController?.navigationBar.layer.borderWidth = 0
        
        //self.tabBarController?.tabBar.isHidden = false
        
        //self.hidesBottomBarWhenPushed = true
    }
    
    /*override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
    }*/

    /*override func viewDidLayoutSubviews() {
        self.tabBarController?.tabBar.isHidden = false
    }*/
    
    /*override func viewWillLayoutSubviews() {
        self.tabBarController?.tabBar.isHidden = false
    }*/
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func araAction(_ sender: Any) {
        if AkisViewController.bas == 0
        {
            createSearchBar()
            AkisViewController.bas = 1
        }
        else if AkisViewController.bas == 1
        {
            self.navigationItem.titleView = nil
            AkisViewController.bas = 0
        }
    }
    
    func createSearchBar()
    {
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Aramak istediğinizi girin"
        searchBar.delegate = self
        
        self.navigationItem.titleView = searchBar
    }
    
    
    @IBAction func filtreleAction(_ sender: Any) {
        filtreleViewController = storyBoard.instantiateViewController(withIdentifier: "FiltreleViewController")
        self.addChildViewController(filtreleViewController)
        filtreleViewController.view.frame = self.view.frame
        self.view.addSubview(filtreleViewController.view)
        
        filtreleViewController.view.center = self.view.center
        filtreleViewController.view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        filtreleViewController.view.alpha = 0
        
        UIView.animate(withDuration: 0.4)
        {
            self.filtreleViewController.view.alpha = 1
            self.filtreleViewController.view.transform = CGAffineTransform.identity
        }
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        filtreleViewController.didMove(toParentViewController: self)
    }
    
    @IBAction func leftSlideAction(_ sender: Any) {
        if (sender as AnyObject).state == .ended
        {
            self.navigationController?.navigationBar.isHidden = true
            BaseViewController.isLeftSlideAction = true
            BaseViewController.isOpen = true
            print("left slide")
            
            let menuVC : MenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
            menuVC.delegate = self
            self.view.addSubview(menuVC.view)
            self.addChildViewController(menuVC)
            menuVC.view.layoutIfNeeded()
            
            
            menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            }, completion:nil)
        }
    }
    
    deinit {
        tableView.dg_removePullToRefresh()
    }
    
    func paslasClick(_ sender: UIButton)
    {
        // text to share
        let text = AkisViewController.yemekPaslasText
        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func longPress(_ longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
        if longPressGestureRecognizer.state == UIGestureRecognizerState.began {
            
            let touchPoint = longPressGestureRecognizer.location(in: self.view)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                
                // your code here, get the row for the indexPath or do whatever you want
                print("basili tutmaya başladım QWEWQE")
                //let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                //var blurEffectController = storyBoard.instantiateViewController(withIdentifier: "BlurEffectViewController")
                /*self.addChildViewController(blurEffectController)
                 self.view.addSubview(blurEffectController.view)
                 blurEffectController.didMove(toParentViewController: self)*/
                //self.superview?.addSubview(blurEffectController)
                /*self.present(blurEffectController, animated:true, completion:nil)
                 UIView.animate(withDuration: 1.0, animations: {
                 blurEffectController.view.alpha = 1.0
                 })*/
                /*UIView.animate(withDuration: 1.0, animations: {
                 self.blurView.alpha = 1.0
                 })*/
                //let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                blurWebViewEffectController = storyBoard.instantiateViewController(withIdentifier: "BlurEffectWebViewController")
                self.addChildViewController(blurWebViewEffectController)
                blurWebViewEffectController.view.frame = self.view.frame
                self.view.addSubview(blurWebViewEffectController.view)
                
                blurWebViewEffectController.view.center = self.view.center
                blurWebViewEffectController.view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
                blurWebViewEffectController.view.alpha = 0
                
                UIView.animate(withDuration: 0.4)
                {
                    self.blurWebViewEffectController.view.alpha = 1
                    self.blurWebViewEffectController.view.transform = CGAffineTransform.identity
                }
                
                self.navigationController?.navigationBar.isHidden = true
                self.tabBarController?.tabBar.isHidden = true
                blurWebViewEffectController.didMove(toParentViewController: self)
            }
        }
        else if longPressGestureRecognizer.state == UIGestureRecognizerState.ended {
            let touchPoint = longPressGestureRecognizer.location(in: self.view)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                
                // your code here, get the row for the indexPath or do whatever you want
                print("basili tutmayı bıraktım")
                UIView.animate(withDuration: 0.3, animations:
                    {
                        self.blurWebViewEffectController.view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
                        self.blurWebViewEffectController.view.alpha = 0
                        
                }) { (success:Bool) in
                    self.navigationController?.navigationBar.isHidden = false
                    self.tabBarController?.tabBar.isHidden = false
                    self.blurWebViewEffectController.view.removeFromSuperview()
                }
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

// MARK: -
// MARK: UITableView Data Source

extension AkisViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }*/
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = Bundle.main.loadNibNamed("SectionTableViewCell", owner: self, options: nil)?.first as! SectionTableViewCell
        cell.backgroundColor = UIColor.white
        self.tableView.backgroundColor = UIColor.white
        switch (section) {
        case 0:
            cell.label.text = "Dün"
            //cell.label.frame.size.width = cell.label.intrinsicContentSize.width + 10
            cell.labelCons.constant = cell.label.intrinsicContentSize.width + 15
            break
        case 1:
            cell.label.text = "Yarın"
            //cell.label.frame.size.width = cell.label.intrinsicContentSize.width + 10
            cell.labelCons.constant = cell.label.intrinsicContentSize.width + 15
            break
        case 2:
            cell.label.text = "Yarından Sonra"
            //cell.label.frame.size.width = cell.label.intrinsicContentSize.width + 10
            cell.labelCons.constant = cell.label.intrinsicContentSize.width + 15
            break
        default:
            cell.label.text = "14 Aralık 2016 Çarşamba"
            //cell.label.frame.size.width = cell.label.intrinsicContentSize.width + 10
            cell.labelCons.constant = cell.label.intrinsicContentSize.width + 15
        }
        
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        let cell = Bundle.main.loadNibNamed("SectionTableViewCell", owner: self, options: nil)?.first as! SectionTableViewCell
        return cell.contentView.frame.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cellIdentifier = "cellIdentifier"
         var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
         
         if cell == nil {
         cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
         cell!.contentView.backgroundColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 251/255.0, alpha: 1.0)
         }
         
         if let cell = cell {
         cell.textLabel?.text = "\((indexPath as NSIndexPath).row)"
         return cell
         }
         
         return UITableViewCell()*/
        if indexPath.section == 0
        {
            let cell = Bundle.main.loadNibNamed("YemekTableViewCell", owner: self, options: nil)?.first as! YemekTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            //cell.isUserInteractionEnabled = false
            AkisViewController.yemekPaslasText = "\(cell.LblOgle.text!) \n \(cell.LblOgleOgun1.text!) \n \(cell.LblOgleOgun2.text!) \n \(cell.LblOgleOgun3.text!) \n \(cell.LblOgleOgun4.text!) \n \(cell.LblAksam.text!) \n \(cell.LblAksamOgun1.text!) \n \(cell.LblAksamOgun2.text!) \n \(cell.LblAksamOgun3.text!) \n \(cell.LblAksamOgun4.text!)"
            cell.BtnPaylas.addTarget(self, action: #selector(paslasClick(_:)), for: UIControlEvents.touchUpInside)
            return cell
        }
        else if indexPath.section == 1
        {
            let cell = Bundle.main.loadNibNamed("NotObsTableViewCell", owner: self, options: nil)?.first as! NotObsTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
        else if indexPath.section == 2
        {
            let cell = Bundle.main.loadNibNamed("DuyuruTableViewCell", owner: self, options: nil)?.first as! DuyuruTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            //cell.isUserInteractionEnabled = false
            return cell
        }
        else if indexPath.section == 3
        {
            let cell = Bundle.main.loadNibNamed("HesapTableViewCell", owner: self, options: nil)?.first as! HesapTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            //cell.isUserInteractionEnabled = false
            return cell
        }
        else if indexPath.section == 4
        {
            let cell = Bundle.main.loadNibNamed("HaberTableViewCell", owner: self, options: nil)?.first as! HaberTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            //cell.isUserInteractionEnabled = false
            return cell
        }
        else if indexPath.section == 5
        {
            let cell = Bundle.main.loadNibNamed("EtkinlikTableViewCell", owner: self, options: nil)?.first as! EtkinlikTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            //cell.isUserInteractionEnabled = false
            return cell
        }
        else
        {
            let cell = Bundle.main.loadNibNamed("YemekTableViewCell", owner: self, options: nil)?.first as! YemekTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            //cell.isUserInteractionEnabled = false
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            let cell = Bundle.main.loadNibNamed("YemekTableViewCell", owner: self, options: nil)?.first as! YemekTableViewCell
            return cell.contentView.frame.height
        }
        else if indexPath.section == 1
        {
            let cell = Bundle.main.loadNibNamed("NotObsTableViewCell", owner: self, options: nil)?.first as! NotObsTableViewCell
            return cell.contentView.frame.height
        }
        else if indexPath.section == 2
        {
            let cell = Bundle.main.loadNibNamed("DuyuruTableViewCell", owner: self, options: nil)?.first as! DuyuruTableViewCell
            return cell.contentView.frame.height
        }
        else if indexPath.section == 3
        {
            let cell = Bundle.main.loadNibNamed("HesapTableViewCell", owner: self, options: nil)?.first as! HesapTableViewCell
            return cell.contentView.frame.height
        }
        else if indexPath.section == 4
        {
            let cell = Bundle.main.loadNibNamed("HaberTableViewCell", owner: self, options: nil)?.first as! HaberTableViewCell
            return cell.contentView.frame.height
        }
        else if indexPath.section == 5
        {
            let cell = Bundle.main.loadNibNamed("EtkinlikTableViewCell", owner: self, options: nil)?.first as! EtkinlikTableViewCell
            return cell.contentView.frame.height
        }
        else
        {
            let cell = Bundle.main.loadNibNamed("YemekTableViewCell", owner: self, options: nil)?.first as! YemekTableViewCell
            return cell.contentView.frame.height
        }
    }
    
}

// MARK: -
// MARK: UITableView Delegate

extension AkisViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        /*let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         var blurEffectController = storyBoard.instantiateViewController(withIdentifier: "BlurEffectViewController")
         self.addChildViewController(blurEffectController)
         self.view.addSubview(blurEffectController.view)
         blurEffectController.didMove(toParentViewController: self)*/
    }
    
}

