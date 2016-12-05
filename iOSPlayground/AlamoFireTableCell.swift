//
//  AlamoFireTableCellTableViewCell.swift
//  iOSPlayground
//
//  Created by Fei Zheng on 12/4/16.
//  Copyright © 2016 Fei Zheng. All rights reserved.
//

import UIKit

class AlamoFireTableCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
