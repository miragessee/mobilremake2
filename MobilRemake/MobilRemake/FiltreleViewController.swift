//
//  FiltreleViewController.swift
//  MobilRemake
//
//  Created by Admin on 19/12/2016.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class FiltreleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filtreleView: UIView!
    @IBOutlet weak var kapatButton: UIButton!
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    var filtreleViewController : UIViewController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        //self.tableView.separatorColor = UIColor( red: 153/255, green: 153/255, blue:0/255, alpha: 0 )
        
        tableView.alwaysBounceVertical = false
        tableView.isScrollEnabled = false
        
        let cell = Bundle.main.loadNibNamed("FiltreleTableViewCell", owner: self, options: nil)?.first as! FiltreleTableViewCell
        tableView.frame.size.height = cell.contentView.frame.height * 4
        
        self.tableView.separatorColor = UIColor( red: 153/255, green: 153/255, blue:0/255, alpha: 0 )
        
        filtreleView.layer.cornerRadius = 8.0
        
        filtreleView.layer.shadowColor = UIColor.black.cgColor
        filtreleView.layer.shadowOffset = CGSize.zero
        filtreleView.layer.shadowOpacity = 0.5
        filtreleView.layer.shadowRadius = 5
        
        kapatButton.backgroundColor = .clear
        kapatButton.layer.cornerRadius = 5
        kapatButton.layer.borderWidth = 1
        kapatButton.layer.borderColor = UIColor.black.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func kapatAction(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations:
            {
                self.view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
                self.view.alpha = 0
                
        }) { (success:Bool) in
            self.navigationController?.navigationBar.isHidden = false
            self.tabBarController?.tabBar.isHidden = false
            self.view.removeFromSuperview()
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

extension FiltreleViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
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
        if indexPath.row == 0
        {
            let cell = Bundle.main.loadNibNamed("FiltreleTableViewCell", owner: self, options: nil)?.first as! FiltreleTableViewCell
            return cell
        }
        else if indexPath.row == 1
        {
            let cell = Bundle.main.loadNibNamed("FiltreleTableViewCell", owner: self, options: nil)?.first as! FiltreleTableViewCell
            cell.label.text = "Duyuru"
            return cell
        }
        else if indexPath.row == 2
        {
            let cell = Bundle.main.loadNibNamed("FiltreleTableViewCell", owner: self, options: nil)?.first as! FiltreleTableViewCell
            cell.label.text = "Yemekhane"
            return cell
        }
        else
        {
            let cell = Bundle.main.loadNibNamed("FiltreleTableViewCell", owner: self, options: nil)?.first as! FiltreleTableViewCell
            cell.label.text = "Etkinlik"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = Bundle.main.loadNibNamed("FiltreleTableViewCell", owner: self, options: nil)?.first as! FiltreleTableViewCell
        return cell.contentView.frame.height
    }
    
}

// MARK: -
// MARK: UITableView Delegate

extension FiltreleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
