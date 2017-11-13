//
//  AkademikTakvimViewController.swift
//  MobilRemake
//
//  Created by Admin on 05/01/2017.
//  Copyright © 2017 miragessee. All rights reserved.
//

import UIKit

class AkademikTakvimViewController: UIViewController , UIWebViewDelegate{

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.delegate = self
        
        //http://oidb.sdu.edu.tr/assets/uploads/sites/73/files/2016-2017-egitim-ogretim-yili-akademik-takvimi.pdf
        
        var URL = NSURL(string: "http://oidb.sdu.edu.tr/assets/uploads/sites/73/files/2016-2017-egitim-ogretim-yili-akademik-takvimi.pdf")
        self.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
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
