//
//  BlurEffectWebViewController.swift
//  MobilRemake
//
//  Created by Admin on 16/12/2016.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class BlurEffectWebViewController: UIViewController , UIWebViewDelegate{

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var blurWebView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.delegate = self
        
        var URL = NSURL(string: "http://w3.sdu.edu.tr/haber/5914/sair-ceketli-cocuk-kazim-koyuncu-sdude-anildi")
        webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
        
        webView.layer.cornerRadius = 8.0
        
        webView.layer.shadowColor = UIColor.black.cgColor
        webView.layer.shadowOffset = CGSize.zero
        webView.layer.shadowOpacity = 0.5
        webView.layer.shadowRadius = 5
        
        blurWebView.layer.cornerRadius = 8.0
        
        blurWebView.layer.shadowColor = UIColor.black.cgColor
        blurWebView.layer.shadowOffset = CGSize.zero
        blurWebView.layer.shadowOpacity = 0.5
        blurWebView.layer.shadowRadius = 5
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
