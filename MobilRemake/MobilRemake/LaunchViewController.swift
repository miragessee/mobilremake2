//
//  LaunchViewController.swift
//  MobilRemake
//
//  Created by Admin on 04/01/2017.
//  Copyright © 2017 miragessee. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var eskiImageY = self.imageView.center.y
        
        var eskiLabelY = self.label.center.y
        
        self.imageView.center.y -= 70
        
        UIView.animate(withDuration: 1, animations:
            {
                self.imageView.center.y = eskiImageY
                self.imageView.alpha = 1
        }) { (success:Bool) in
            print("bitti asdasd")
            
            /*// MARK: - Karşılama Ekranına git
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "KarsilamaEkrani")
            self.present(nextViewController, animated:true, completion:nil)*/
            
            self.label.center.y += 30
            
            UIView.animate(withDuration: 1, animations:
                {
                    self.label.center.y = eskiLabelY
                    self.label.alpha = 1
            }) { (success:Bool) in
                print("bitti asdasd")
                
                /*// MARK: - Karşılama Ekranına git
                 
                 let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                 
                 let nextViewController = storyBoard.instantiateViewController(withIdentifier: "KarsilamaEkrani")
                 self.present(nextViewController, animated:true, completion:nil)*/
                
                UIView.animate(withDuration: 0.5, animations:
                    {
                        self.label.center.y += 10
                }) { (success:Bool) in
                    print("bitti asdasd")
                    
                    /*// MARK: - Karşılama Ekranına git
                     
                     let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                     
                     let nextViewController = storyBoard.instantiateViewController(withIdentifier: "KarsilamaEkrani")
                     self.present(nextViewController, animated:true, completion:nil)*/
                    UIView.animate(withDuration: 1, animations:
                        {
                            self.indicator.alpha = 1
                    }) { (success:Bool) in
                        print("bitti asdasd")
                        
                        // MARK: - Karşılama Ekranına git
                         
                         let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                         
                         let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Login")
                         self.present(nextViewController, animated:true, completion:nil)
                    }
                }
            }
        }
        
        
    }

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
