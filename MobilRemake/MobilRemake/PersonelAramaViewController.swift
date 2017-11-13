//
//  PersonelAramaViewController.swift
//  MobilRemake
//
//  Created by Admin on 10/01/2017.
//  Copyright © 2017 miragessee. All rights reserved.
//

import UIKit

class PersonelAramaViewController: UIViewController , UISearchBarDelegate{

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
        searchBar.placeholder = "Aramak istediğinizi girin                                        "
        searchBar.delegate = self
        
        self.navigationItem.titleView = searchBar
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) // called when keyboard search button pressed
    {
        print(searchBar.text)
        
        if (searchBar.text?.caseInsensitiveCompare("ecir") == ComparisonResult.orderedSame)
        {
            tableView.isHidden = false
        }
        
        searchBar.resignFirstResponder()
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

extension PersonelAramaViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 31
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("PersonelAramaTableViewCell", owner: self, options: nil)?.first as! PersonelAramaTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = Bundle.main.loadNibNamed("PersonelAramaTableViewCell", owner: self, options: nil)?.first as! PersonelAramaTableViewCell
        return cell.contentView.frame.height
    }
    
}

// MARK: -
// MARK: UITableView Delegate

extension PersonelAramaViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
