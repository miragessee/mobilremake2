//
//  CheckBoxTableViewCell.swift
//  MobilRemake
//
//  Created by Admin on 09/12/16.
//  Copyright © 2016 miragessee. All rights reserved.
//

import UIKit

class CheckBoxTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBox: VKCheckbox!
    
    public static var checkBoxDurumu: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checkBox.line             = .thin
         checkBox.bgColorSelected  = UIColor.gray
         checkBox.bgColor          = UIColor.gray
         checkBox.color            = UIColor.white
         checkBox.borderColor      = UIColor.gray
         checkBox.borderWidth      = 2
         
         checkBox.checkboxValueChangedBlock = {
         isOn in
            if isOn
            {
                print("acik")
            }
            else
            {
                print("kapali")
            }
         }
        
        checkBox.setOn(CheckBoxTableViewCell.checkBoxDurumu, animated: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
