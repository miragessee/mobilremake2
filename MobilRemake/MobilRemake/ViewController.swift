//
//  ViewController.swift
//  MobilRemake
//
//  Created by Admin on 02/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class ViewController: BaseViewController , UIWebViewDelegate, IKullaniciBilgileriniGetir{

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var yenile: UIButton!
    @IBOutlet weak var hataMesaji: UILabel!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    var startUrl="https://stso.sdu.edu.tr/core/connect/authorize?client_id=sdumobil&response_type=id_token+token&scope=openid+read+write+r_email+r_kimlik_no&redirect_uri=oob%3A%2F%2Flocalhost%2Fskswpfclient&state=";
    var loginUrl="https://stso.sdu.edu.tr/core/login?signin=";
    var idTokenUrl="https://stso.sdu.edu.tr/core/connect/authorize?client_id=sdumobil&response_type=id_token&scope=openid+email+kimlik_no&redirect_uri=oob%3A%2F%2Flocalhost%2Fskswpfclient&state=";
    
    var _state : String = ""
    var nonce : String = ""
    
    var ent : KullaniciKapaliHelper? = nil
    
    var erol : String = ""
    
    static var accessTokenx : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.scrollView.isScrollEnabled=false
        webView.scrollView.bounces=false
        webView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yenileClick(_ sender: Any) {
        if Reachability.isConnectedToNetwork() == false
        {
            myActivityIndicator.isHidden = false
            label.isHidden = true
            hataMesaji.isHidden = true
            yenile.isHidden = true
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.myActivityIndicator.isHidden = true
                self.label.isHidden = false
                self.hataMesaji.isHidden = false
                self.yenile.isHidden = false
                self.webView.isHidden = true
                //self.webView.reload()
            }
        }
        else
        {
            myActivityIndicator.isHidden = false
            label.isHidden = true
            hataMesaji.isHidden = true
            yenile.isHidden = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.myActivityIndicator.isHidden = true
                self.label.isHidden = true
                self.hataMesaji.isHidden = true
                self.yenile.isHidden = true
                self.webView.isHidden = false
                self._state = UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased()
                self.nonce = UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased()
                var URL = NSURL(string: self.startUrl + self._state + "&nonce=" + self.nonce)
                self.webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        label.font = UIFont.swiftFontello(ofSize: 50)
        label.text = String.fontFontelloIcon(name: SwiftFontello.FTLCloudFlashAlt)
        label.textColor = HexStringToUIColor.hexStringToUIColor(hex: "#142E3C")
        
        yenile.backgroundColor = HexStringToUIColor.hexStringToUIColor(hex: "#142E3C")
        
        if Reachability.isConnectedToNetwork() == true
        {
            _state = UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased()
            nonce = UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased()
            var URL = NSURL(string: startUrl + _state + "&nonce=" + nonce)
            webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
        }
        else
        {
            webView.isHidden = true
            myActivityIndicator.isHidden = true
            
            label.isHidden = false
            hataMesaji.isHidden = false
            yenile.isHidden = false
        }
    }
    
    
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if request != nil && request.description.contains("oob://localhost/skswpfclient")
        {
            var url = request.description.components(separatedBy: "oob://localhost/skswpfclient#")
            
            var dizi2 = url[1].components(separatedBy: "&")
            
            if ent == nil
            {
                ent = KullaniciKapaliHelper()
            }
            
            var helper : KullaniciHelper? = nil
            var helper2 : KullaniciHelper? = nil
            
            if dizi2.count == 7
            {
                ent?.id_tokenFunc = dizi2[0].components(separatedBy: "=")[1]
                ent?.access_tokenFunc = dizi2[1].components(separatedBy: "=")[1]
                ent?.token_typeFunc = dizi2[3].components(separatedBy: "=")[1]
                ent?.expires_inFunc = dizi2[4].components(separatedBy: "=")[1]
                ent?.scopeFunc = dizi2[4].components(separatedBy: "=")[1]
                ent?.stateFunc = dizi2[5].components(separatedBy: "=")[1]
                ent?.session_stateFunc = dizi2[6].components(separatedBy: "=")[1]
            }
            else if dizi2.count == 4
            {
                ent?.id_tokenFunc = dizi2[0].components(separatedBy: "=")[1]
                ent?.scopeFunc = dizi2[1].components(separatedBy: "=")[1]
                ent?.stateFunc = dizi2[2].components(separatedBy: "=")[1]
                ent?.session_stateFunc = dizi2[3].components(separatedBy: "=")[1]
            }
            
            helper = Ortak.TokenCozGetir(token: (ent?.id_tokenFunc)!)
            helper2 = Ortak.TokenCozGetir(token: (ent?.access_tokenFunc)!)
            
            if (ent?.access_tokenFunc != nil && !(ent?.access_tokenFunc.isEmpty)!) && helper?.Kimlik_noFunc == ""
            {
                var URL = NSURL(string: idTokenUrl + startUrl + _state + "&nonce=" + nonce)
                webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
                
                if helper != nil && helper?.Kimlik_noFunc != nil
                {
                    ViewController.accessTokenx = (ent?.access_tokenFunc)!
                    ent?.Kullanici_ozelFunc = helper!
                    SharedPreferencesHelper().KullaniciBilgisiniKaydet(helper?.toJSONString())
                    SharedPreferencesHelper().KullaniciBilgisiniKaydet(helper2?.toJSONString())
                    KullaniciBilgileriniGetir()
                }
                else
                {
                    return false
                }
            }
        }
        return true
    }
    
    func KullaniciBilgileriniGetir()
    {
        let kullaniciBilgileriniGetir = KullaniciBilgileriniGetirParameters()
        
        kullaniciBilgileriniGetir?.CihazId = UIDevice.current.identifierForVendor!.uuidString.replacingOccurrences(of: "-", with: "");
        
        KullaniciBilgileriniGetirService(listener: self,listenerServiceError:self as! IOnTCServiceError).ServiceGit(kullaniciBilgileriniGetir!)
    }

    func webViewDidStartLoad(_ webView: UIWebView)
    {
        webView.isHidden = true
        myActivityIndicator.isHidden = false
        //myActivityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        if (webView.request?.url?.absoluteString.contains("https://stso.sdu.edu.tr/core/login?signin="))!
        {
            webView.isHidden = false
            //myActivityIndicator.stopAnimating()
            myActivityIndicator.isHidden = true
        }
        else
        {
            webView.isHidden = true
            myActivityIndicator.isHidden = false
            //myActivityIndicator.startAnimating()
        }
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error)
    {
    }
    
    func onTaskCompletedKullaniciBilgileriniGetir(_ gelen: ServiceMessageModel<KullaniciBilgileriniGetirResponse>) {
        print("---------")
        print(gelen)
        print(gelen.Icerik!)
        print(gelen.Message!)
        
        var sonuc = JsonParser<KullaniciBilgileriniGetirResponse>()!.ParsEt((gelen.Icerik?.toJSONString())!)
        var shared = SharedPreferencesHelper<Any>().KullaniciBilgileriniGetir()

        var kayitli = JsonParser<KullaniciHelper>()!.ParsEt(shared as! String)!
        
        kayitli.Ad_SoyadFunc = (sonuc?.KullaniciBilgileri?.AdSoyad)!
        kayitli.durumFunc = (sonuc?.KullaniciBilgileri?.Durum)!
        kayitli.IsObs = (sonuc?.KullaniciBilgileri?.IsObs)!
        kayitli.IsGolcuk = (sonuc?.KullaniciBilgileri?.IsGolcuk)!
        kayitli.IsPersonel = (sonuc?.KullaniciBilgileri?.IsPersonel)!
        
        ent?.Kullanici_ozelFunc = kayitli
        
        SharedPreferencesHelper().KullaniciBilgisiniKaydet(kayitli.toJSONString())
        
        // MARK: - Akışa git
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "NavController")
        self.present(nextViewController, animated:true, completion:nil)
    }
}

