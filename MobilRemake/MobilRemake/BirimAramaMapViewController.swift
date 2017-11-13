//
//  BirimAramaMapViewController.swift
//  MobilRemake
//
//  Created by Admin on 11/01/2017.
//  Copyright © 2017 miragessee. All rights reserved.
//

import UIKit

class BirimAramaMapViewController: UIViewController , UISearchBarDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createSearchBar()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.separatorColor = UIColor( red: 153/255, green: 153/255, blue:0/255, alpha: 0 )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createSearchBar()
    {
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Aramak istediğinizi girin"
        searchBar.delegate = self
        
        self.navigationItem.titleView = searchBar
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

extension BirimAramaMapViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 31
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0
        {
            let cell = Bundle.main.loadNibNamed("BirimAramaMapHeaderTableViewCell", owner: self, options: nil)?.first as! BirimAramaMapHeaderTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
        else
        {
            let cell = Bundle.main.loadNibNamed("BirimAramaMapTableViewCell", owner: self, options: nil)?.first as! BirimAramaMapTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            let cell = Bundle.main.loadNibNamed("BirimAramaMapHeaderTableViewCell", owner: self, options: nil)?.first as! BirimAramaMapHeaderTableViewCell
            return cell.contentView.frame.height
        }
        else
        {
            let cell = Bundle.main.loadNibNamed("BirimAramaMapTableViewCell", owner: self, options: nil)?.first as! BirimAramaMapTableViewCell
            return cell.contentView.frame.height
        }
    }
    
}

// MARK: -
// MARK: UITableView Delegate

extension BirimAramaMapViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
