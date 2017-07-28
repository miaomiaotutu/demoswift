//
//  TableViewCell.swift
//  demoswift
//
//  Created by lyscds2017 on 2017/7/25.
//  Copyright © 2017年 miaojinliang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var slider: UISlider!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.slider.minimumValue = 0
        self.slider.maximumValue = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
