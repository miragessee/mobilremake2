//
//  MesajTableViewCell.swift
//  MobilRemake
//
//  Created by Admin on 10/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class MesajTableViewCell: UITableViewCell {
    
    //let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    //var blurEffectController : UIViewController = UIViewController()
    //var mesajTableViewController : UITableViewController = UITableViewController()
    //var mesajViewController : UIViewController = UIViewController()
    @IBOutlet weak var cizgiGradientView: GradientView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //blurEffectController = storyBoard.instantiateViewController(withIdentifier: "BlurEffectViewController")
        //mesajTableViewController = storyBoard.instantiateViewController(withIdentifier: "MesajTableViewController") as! UITableViewController
        //mesajViewController = storyBoard.instantiateViewController(withIdentifier: "MesajViewController")
        
        cizgiGradientView.colors = [.white,.gray]
        
        cizgiGradientView.direction = .horizontal
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
