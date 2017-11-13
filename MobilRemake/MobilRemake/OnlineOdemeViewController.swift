//
//  OnlineOdemeViewController.swift
//  MobilRemake
//
//  Created by Admin on 06/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class OnlineOdemeViewController: UIViewController , UIWebViewDelegate{
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addSlideMenuButton()
        // Do any additional setup after loading the view.
        webView.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false;
        var URL = NSURL(string: "https://oos.sdu.edu.tr/")
        webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
        
        //self.tabBarController?.tabBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        
        webView.scrollView.contentInset = UIEdgeInsets.zero;
        
        self.tabBarController?.tabBar.isHidden = true
    }*/
    
    /*override func viewDidLayoutSubviews() {
        self.tabBarController?.tabBar.isHidden = true
    }*/


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
