//
//  KarsilamaViewController.swift
//  MobilRemake
//
//  Created by Admin on 04/01/2017.
//  Copyright © 2017 miragessee. All rights reserved.
//

import UIKit

class KarsilamaViewController: UIViewController {

    @IBOutlet weak var etkinlikTableView: UITableView!
    @IBOutlet weak var yemekArkaSaatView: UIView!
    @IBOutlet weak var yemekArkaOgleView: UIView!
    @IBOutlet weak var yemekArkaSabahView: UIView!
    @IBOutlet weak var etkinlikArkaSaatView: UIView!
    @IBOutlet weak var haberArkaSaatView: UIView!
    @IBOutlet weak var duyuruArkaSaatView: UIView!
    @IBOutlet var yemekhaneScreenEdge: UIScreenEdgePanGestureRecognizer!
    @IBOutlet var yemekhaneArkaScreenEdge: UIScreenEdgePanGestureRecognizer!
    @IBOutlet var etkinlikArkaScreenEdge: UIScreenEdgePanGestureRecognizer!
    @IBOutlet var etkinlikScreenEdge: UIScreenEdgePanGestureRecognizer!
    @IBOutlet weak var kapatOnView: UIView!
    @IBOutlet weak var akisOnView: UIView!
    @IBOutlet weak var etkinlikArkaView: UIView!
    @IBOutlet weak var yemekhaneArkaView: UIView!
    @IBOutlet weak var etkinlikOnView: UIView!
    @IBOutlet weak var yemekhaneOnView: UIView!
    @IBOutlet weak var ucuncuView: UIView!
    @IBOutlet weak var ikinciView: UIView!
    @IBOutlet var haberScreenEdge: UIScreenEdgePanGestureRecognizer!
    @IBOutlet var haberArkaScreenEdge: UIScreenEdgePanGestureRecognizer!
    @IBOutlet weak var haberArkaView: UIView!
    @IBOutlet weak var haberOnView: UIView!
    @IBOutlet weak var duyuruOnView: UIView!
    @IBOutlet weak var duyuruArkaView: UIView!
    @IBOutlet weak var birinciView: UIView!
    @IBOutlet var duyuruArkaScreenEdge: UIScreenEdgePanGestureRecognizer!
    
    var navBar: UINavigationBar = UINavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        duyuruArkaScreenEdge.edges = .left
        haberArkaScreenEdge.edges = .left
        haberScreenEdge.edges = .left
        etkinlikScreenEdge.edges = .right
        etkinlikArkaScreenEdge.edges = .left
        yemekhaneArkaScreenEdge.edges = .left
        yemekhaneScreenEdge.edges = .left
        
        setNavBarToTheView()
        
        duyuruArkaSaatView.layer.masksToBounds = false
        duyuruArkaSaatView.layer.cornerRadius = duyuruArkaSaatView.frame.height/2
        duyuruArkaSaatView.clipsToBounds = true
        
        haberArkaSaatView.layer.masksToBounds = false
        haberArkaSaatView.layer.cornerRadius = haberArkaSaatView.frame.height/2
        haberArkaSaatView.clipsToBounds = true
        
        etkinlikArkaSaatView.layer.masksToBounds = false
        etkinlikArkaSaatView.layer.cornerRadius = etkinlikArkaSaatView.frame.height/2
        etkinlikArkaSaatView.clipsToBounds = true
        
        yemekArkaSabahView.layer.masksToBounds = false
        yemekArkaSabahView.layer.cornerRadius = 8.0
        yemekArkaSabahView.clipsToBounds = true
        
        yemekArkaOgleView.layer.masksToBounds = false
        yemekArkaOgleView.layer.cornerRadius = 8.0
        yemekArkaOgleView.clipsToBounds = true
        
        yemekArkaSaatView.layer.masksToBounds = false
        yemekArkaSaatView.layer.cornerRadius = yemekArkaSaatView.frame.height/2
        yemekArkaSaatView.clipsToBounds = true
        
        etkinlikTableView.dataSource = self
        etkinlikTableView.delegate = self
        
        self.etkinlikTableView.separatorColor = UIColor( red: 153/255, green: 153/255, blue:0/255, alpha: 0 )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNavBarToTheView() {
        self.navBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: birinciView.frame.origin.y-1)
        self.navBar.backgroundColor = HexStringToUIColor.hexStringToUIColor(hex: "#142E3C")
        self.view.addSubview(navBar)
    }
    
    @IBAction func haberTapGestureAction(_ sender: Any) {
        print("Haber")
        /*UIView.transition(with: self.haberOnView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
            
        }, completion:  { finished in
            //HERE you can remove your old view
            //oldView.removeFromSuperview()
            self.haberArkaView.alpha = 1
        })*/
        UIView.animate(withDuration: 0.8, animations:
            {
                self.haberArkaView.alpha = 1
                
        }) { (success:Bool) in
        }
    }
    
    @IBAction func yemekhaneScreenEdgeAction(_ sender: Any) {
        if (sender as AnyObject).state == .ended
        {
            /*UIView.transition(with: self.yemekhaneOnView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
                
            }, completion:  { finished in
                //HERE you can remove your old view
                //oldView.removeFromSuperview()
                self.yemekhaneArkaView.alpha = 1
            })*/
            UIView.animate(withDuration: 0.8, animations:
                {
                    self.yemekhaneArkaView.alpha = 1
                    
            }) { (success:Bool) in
            }
        }
    }
    
    @IBAction func etkinlikTapGestureAction(_ sender: Any) {
        print("Etkinlik")
        /*UIView.transition(with: self.etkinlikOnView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
            
        }, completion:  { finished in
            //HERE you can remove your old view
            //oldView.removeFromSuperview()
            self.etkinlikArkaView.alpha = 1
        })*/
        UIView.animate(withDuration: 0.8, animations:
            {
                self.etkinlikArkaView.alpha = 1
                
        }) { (success:Bool) in
        }
    }
    
    @IBAction func etkinlikScreenEdgeAction(_ sender: Any) {
        if (sender as AnyObject).state == .ended
        {
            /*UIView.transition(with: self.etkinlikOnView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
                
            }, completion:  { finished in
                //HERE you can remove your old view
                //oldView.removeFromSuperview()
                self.etkinlikArkaView.alpha = 1
            })*/
            UIView.animate(withDuration: 0.8, animations:
                {
                    self.etkinlikArkaView.alpha = 1
                    
            }) { (success:Bool) in
            }
        }
    }
    
    @IBAction func yemekhaneTapGestureAction(_ sender: Any) {
        print("Yemekhane")
        /*UIView.transition(with: self.yemekhaneOnView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
            
        }, completion:  { finished in
            //HERE you can remove your old view
            //oldView.removeFromSuperview()
            self.yemekhaneArkaView.alpha = 1
        })*/
        UIView.animate(withDuration: 0.8, animations:
            {
                self.yemekhaneArkaView.alpha = 1
                
        }) { (success:Bool) in
        }
    }
    
    @IBAction func yemekhaneArkaScreenEdgeAction(_ sender: Any) {
        if (sender as AnyObject).state == .ended
        {
            /*UIView.transition(with: self.yemekhaneArkaView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
                
            }, completion:  { finished in
                //HERE you can remove your old view
                //oldView.removeFromSuperview()
                self.yemekhaneArkaView.alpha = 0
            })*/
            UIView.animate(withDuration: 0.8, animations:
                {
                    self.yemekhaneArkaView.alpha = 0
                    
            }) { (success:Bool) in
            }
        }
    }
    
    @IBAction func akisTapGestureAction(_ sender: Any) {
        print("Akış")
        // MARK: - Akışa git
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBar")
        self.present(nextViewController, animated:true, completion:nil)
    }

    @IBAction func kapatTapGestureAction(_ sender: Any) {
        print("Kapat")
        exit(0)
    }
    
    @IBAction func etkinlikArkaTapGestureAction(_ sender: Any) {
        /*UIView.transition(with: self.etkinlikArkaView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            
        }, completion:  { finished in
            //HERE you can remove your old view
            self.etkinlikArkaView.alpha = 0
        })*/
        UIView.animate(withDuration: 0.8, animations:
            {
                self.etkinlikArkaView.alpha = 0
                
        }) { (success:Bool) in
        }
    }
    
    @IBAction func etkinlikArkaScreenEdgeAction(_ sender: Any) {
        if (sender as AnyObject).state == .ended
        {
            /*UIView.transition(with: self.etkinlikArkaView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
                
            }, completion:  { finished in
                //HERE you can remove your old view
                //oldView.removeFromSuperview()
                self.etkinlikArkaView.alpha = 0
            })*/
            UIView.animate(withDuration: 0.8, animations:
                {
                    self.etkinlikArkaView.alpha = 0
                    
            }) { (success:Bool) in
            }
        }
    }
    @IBAction func yemekhaneArkaTapActionGesture(_ sender: Any) {
        /*UIView.transition(with: self.yemekhaneArkaView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            
        }, completion:  { finished in
            //HERE you can remove your old view
            self.yemekhaneArkaView.alpha = 0
        })*/
        UIView.animate(withDuration: 0.8, animations:
            {
                self.yemekhaneArkaView.alpha = 0
                
        }) { (success:Bool) in
        }
    }
    
    @IBAction func duyuruTapGestureAction(_ sender: Any) {
        print("Duyuru")
        /*UIView.transition(with: self.duyuruOnView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {

        }, completion:  { finished in
            //HERE you can remove your old view
            //oldView.removeFromSuperview()
            self.duyuruArkaView.alpha = 1
        })*/
        UIView.animate(withDuration: 0.8, animations:
            {
                self.duyuruArkaView.alpha = 1
                
        }) { (success:Bool) in
        }
    }
    
    @IBAction func duyuruScreenEdgeAction(_ sender: Any) {
        if (sender as AnyObject).state == .ended
        {
        /*UIView.transition(with: self.duyuruOnView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
            
        }, completion:  { finished in
            //HERE you can remove your old view
            //oldView.removeFromSuperview()
            self.duyuruArkaView.alpha = 1
        })*/
            UIView.animate(withDuration: 0.8, animations:
                {
                    self.duyuruArkaView.alpha = 1
                    
            }) { (success:Bool) in
            }
        }
    }
    
    @IBAction func haberScreenEdgeAction(_ sender: Any) {
        if (sender as AnyObject).state == .ended
        {
            /*UIView.transition(with: self.haberOnView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
                
            }, completion:  { finished in
                //HERE you can remove your old view
                //oldView.removeFromSuperview()
                self.haberArkaView.alpha = 1
            })*/
            UIView.animate(withDuration: 0.8, animations:
                {
                    self.haberArkaView.alpha = 1
                    
            }) { (success:Bool) in
            }
        }
    }
    
    @IBAction func duyuruArkaTapGestureAction(_ sender: Any) {
        /*UIView.transition(with: self.duyuruArkaView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            
        }, completion:  { finished in
            //HERE you can remove your old view
            self.duyuruArkaView.alpha = 0
        })*/
        UIView.animate(withDuration: 0.8, animations:
            {
                self.duyuruArkaView.alpha = 0
                
        }) { (success:Bool) in
        }
    }

    @IBAction func haberArkaTapGestureAction(_ sender: Any) {
        /*UIView.transition(with: self.haberArkaView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            
        }, completion:  { finished in
            //HERE you can remove your old view
            self.haberArkaView.alpha = 0
        })*/
        UIView.animate(withDuration: 0.8, animations:
            {
                self.haberArkaView.alpha = 0
                
        }) { (success:Bool) in
        }
    }
    
    @IBAction func haberArkaScreenEdgeAction(_ sender: Any) {
        if (sender as AnyObject).state == .ended
        {
            /*UIView.transition(with: self.haberArkaView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
                
            }, completion:  { finished in
                //HERE you can remove your old view
                self.haberArkaView.alpha = 0
            })*/
            UIView.animate(withDuration: 0.8, animations:
                {
                    self.haberArkaView.alpha = 0
                    
            }) { (success:Bool) in
            }
        }
    }
    @IBAction func duyuruArkaScreenEdgeAction(_ sender: Any) {
        if (sender as AnyObject).state == .ended
        {
        /*UIView.transition(with: self.duyuruArkaView, duration: 0.8, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            
        }, completion:  { finished in
            //HERE you can remove your old view
            self.duyuruArkaView.alpha = 0
        })*/
            UIView.animate(withDuration: 0.8, animations:
                {
                    self.duyuruArkaView.alpha = 0
                    
            }) { (success:Bool) in
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

extension KarsilamaViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 31
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

        if (indexPath.row == 0)
        {
            let cell = Bundle.main.loadNibNamed("KarsilamaEtkinlikTableViewCell", owner: self, options: nil)?.first as! KarsilamaEtkinlikTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            //cell.isUserInteractionEnabled = false
            return cell
        }
        else
        {
            let cell = Bundle.main.loadNibNamed("KarsilamaEtkinlikTableViewCell", owner: self, options: nil)?.first as! KarsilamaEtkinlikTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.etkinlikAdi.text = "null - Test Etkinliği " +  "\(indexPath.row + 1)"
            //cell.isUserInteractionEnabled = false
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let cell = Bundle.main.loadNibNamed("KarsilamaEtkinlikTableViewCell", owner: self, options: nil)?.first as! KarsilamaEtkinlikTableViewCell
            return cell.contentView.frame.height
    }
    
}

// MARK: -
// MARK: UITableView Delegate

extension KarsilamaViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        /*let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         var blurEffectController = storyBoard.instantiateViewController(withIdentifier: "BlurEffectViewController")
         self.addChildViewController(blurEffectController)
         self.view.addSubview(blurEffectController.view)
         blurEffectController.didMove(toParentViewController: self)*/
    }
    
}

