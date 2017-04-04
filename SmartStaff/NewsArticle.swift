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
import RealmSwift

 
 class NewsArticle:Object {
    dynamic var title: String?
    dynamic var body:String?
    dynamic var category:String?
    dynamic var createTime:String?
    dynamic var image:String?
    dynamic var id:String?
 
    convenience init (title:String, body:String, category:String, image:String, id:String, createTime:String) {
        self.init()
        self.title = title
        self.body = body
        self.category = category
        self.image = image
        self.id = id
        self.createTime = createTime
    }
    
}
