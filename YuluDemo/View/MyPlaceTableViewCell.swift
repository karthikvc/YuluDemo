//
//  MyPlaceTableViewCell.swift
//  YuluDemo
//
//  Created by Admin on 10/19/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MyPlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var pImage: UIView!
   
    @IBOutlet weak var pTitle: UILabel!
    @IBOutlet weak var PDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
