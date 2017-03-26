//
//  MessagesCell.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/26/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit

class MessagesCell: UITableViewCell {

    
    @IBOutlet weak var authorImg: UIImageView!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var msgTitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        authorImg.layer.cornerRadius = 5
        authorImg.clipsToBounds = true
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
