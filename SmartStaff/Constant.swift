//
//  Constant.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/20/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import Foundation
import KeychainAccess

typealias DownloadComplete = () -> ()


let API_URL = "http://103.18.7.212:32784/"
let API_URL_LOGIN = "http://103.18.7.212:32784/users/login"
let API_URL_DOCUMENT = "http://103.18.7.212:32784/docs"
let API_URL_NEWS = "http://103.18.7.212:32784/news"
let API_URL_IT_SECTIONS = "http://103.18.7.212:32784/postITs/categories"
let API_URL_SEARCH_ARTICLES = "http://103.18.7.212:32784/news/searchByTitle"

let keychain = Keychain(server: API_URL, protocolType: .https)
let authCode = keychain["authcode"]


public enum ApiURI:String {
    case Login = "users/login"
    case Document = "docs"
    case ITsection = "postITs/categories"
    case SearchTitles = "postITs/categories/"
}
