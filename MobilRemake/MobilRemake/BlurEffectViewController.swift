//
//  BlurEffectViewController.swift
//  MobilRemake
//
//  Created by Admin on 13/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class BlurEffectViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    static var effect:UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        popupView.layer.cornerRadius = 8.0
        
        popupView.layer.shadowColor = UIColor.black.cgColor
        popupView.layer.shadowOffset = CGSize.zero
        popupView.layer.shadowOpacity = 0.5
        popupView.layer.shadowRadius = 5
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
