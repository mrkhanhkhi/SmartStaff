 //
//  NewsArticle.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/20/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import KeychainAccess
 
 class NewsArticle:NSObject {
    var title: String?
    var body:String?
    var category:String?
    var createTime:String?
    var image:String?
    var id:String?
 
    init (title:String, body:String, category:String, image:String, id:String, createTime:String) {
    self.title = title
    self.body = body
    self.category = category
    self.image = image
    self.id = id
    self.createTime = createTime
    }
}
