//
//  Documents.swift
//  SmartStaff
//
//  Created by Admin on 3/30/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import Foundation

class Documents {
    var id: String?
    var title:String?
    var createTime:CLong?
    var url:String?
    
    init (title:String, id:String, createTime:CLong?, url:String) {
        self.title = title
        self.id = id
        self.createTime = createTime
        self.url = url
    }
}
