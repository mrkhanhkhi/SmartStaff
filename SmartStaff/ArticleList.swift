//
//  ArticleList.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 4/4/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import RealmSwift

class ArticleList:Object {
    dynamic var name = ""
    let articles = List<NewsArticle>()
}
