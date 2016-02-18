//
//  ListTableViewCell.swift
//  WordList
//
//  Created by 共田 恭輔 on 2016/02/18.
//  Copyright © 2016年 共田 恭輔. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var englishLabel : UILabel!
    @IBOutlet var japaneseLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
