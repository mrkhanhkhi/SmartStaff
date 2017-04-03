//
//  NewsCell.swift
//  SmartStaff
//
//  Created by Admin on 3/20/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    var newsArticle:NewsArticle!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(article:NewsArticle) {
        self.newsArticle = article
        titleLabel.text = self.newsArticle.title
        if let imgURl = self.newsArticle.image {
            thumbImage.sd_setImage(with: URL(string: imgURl), placeholderImage:nil)
        }
    }
    
}
