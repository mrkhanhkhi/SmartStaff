//
//  ITsectionCell.swift
//  SmartStaff
//
//  Created by Admin on 3/21/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit

class ITsectionCell: UICollectionViewCell {
    
    var section:Sections!
    @IBOutlet weak var sectionImg: UIImageView!
    @IBOutlet weak var sectionNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(section:Sections) {
        self.section = section
        sectionNameLabel.text = self.section.title
        if let imgURl = self.section.image {
            sectionImg.sd_setImage(with: URL(string: imgURl), placeholderImage:nil)
        }
    }

}
