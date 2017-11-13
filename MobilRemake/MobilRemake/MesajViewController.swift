//
//  MesajViewController.swift
//  MobilRemake
//
//  Created by Admin on 12/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit
import DGElasticPullToRefresh

class MesajViewController: BaseViewController , UIGestureRecognizerDelegate{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var blurView: UIView!
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    var blurEffectController : UIViewController = UIViewController()
    
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
        loadingView.tintColor = HexStringToUIColor.hexStringToUIColor(hex: "#142E3C")
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(1.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                self?.tableView.dg_stopLoading()
            })
            }, loadingView: loadingView)
        tableView.dg_setPullToRefreshFillColor(UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0))
        tableView.dg_setPullToRefreshBackgroundColor(UIColor.white)
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.longPress(_:)))
        longPressGesture.minimumPressDuration = 0.3 // 1 second press
        
        longPressGesture.delegate = self
        self.tableView.addGestureRecognizer(longPressGesture)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage(named: "")
        self.navigationController?.navigationBar.layer.borderWidth = 0
        
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        self.navigationController?.navigationBar.layer.borderColor =
            UIColor.orange.cgColor
        self.navigationController?.navigationBar.layer.borderWidth = 0
        
        self.tableView.separatorColor = UIColor( red: 153/255, green: 153/255, blue:0/255, alpha: 0 )
        
        //self.tabBarController?.tabBar.isHidden = false
    }
    
    deinit {
        tableView.dg_removePullToRefresh()
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
                blurEffectController = storyBoard.instantiateViewController(withIdentifier: "BlurEffectViewController")
                
                self.addChildViewController(blurEffectController)
                blurEffectController.view.frame = self.view.frame
                self.view.addSubview(blurEffectController.view)
                
                blurEffectController.view.center = self.view.center
                blurEffectController.view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
                blurEffectController.view.alpha = 0
                
                UIView.animate(withDuration: 0.4)
                {
                    self.blurEffectController.view.alpha = 1
                    self.blurEffectController.view.transform = CGAffineTransform.identity
                }
                
                self.navigationController?.navigationBar.isHidden = true
                self.tabBarController?.tabBar.isHidden = true
                blurEffectController.didMove(toParentViewController: self)
            }
        }
        else if longPressGestureRecognizer.state == UIGestureRecognizerState.ended {
            let touchPoint = longPressGestureRecognizer.location(in: self.view)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                
                // your code here, get the row for the indexPath or do whatever you want
                print("basili tutmayı bıraktım")
                //self.navigationController?.navigationBar.isHidden = false
                //self.tabBarController?.tabBar.isHidden = false
                //blurEffectController.view.removeFromSuperview()
                
                UIView.animate(withDuration: 0.3, animations:
                {
                    self.blurEffectController.view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
                    self.blurEffectController.view.alpha = 0
                    
                }) { (success:Bool) in
                    self.navigationController?.navigationBar.isHidden = false
                    self.tabBarController?.tabBar.isHidden = false
                    self.blurEffectController.view.removeFromSuperview()
                }
            }
        }
    }
    
    /*override func viewDidLayoutSubviews() {
        self.tabBarController?.tabBar.isHidden = false
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension MesajViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
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
        /*if (indexPath.row == 0)
        {
            return UITableViewCell()
        }
        else
        {*/
            let cell = Bundle.main.loadNibNamed("Mesaj2TableViewCell", owner: self, options: nil)?.first as! Mesaj2TableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        //}
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        /*if (indexPath.row == 0)
        {
            return 2
        }
        else*/
        //{
            let cell = Bundle.main.loadNibNamed("Mesaj2TableViewCell", owner: self, options: nil)?.first as! Mesaj2TableViewCell
            return cell.contentView.frame.height
        //}
    }
    
}

// MARK: -
// MARK: UITableView Delegate

extension MesajViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        /*let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        var blurEffectController = storyBoard.instantiateViewController(withIdentifier: "BlurEffectViewController")
        self.addChildViewController(blurEffectController)
        self.view.addSubview(blurEffectController.view)
        blurEffectController.didMove(toParentViewController: self)*/
    }
    
}

