//
//  Constant.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/20/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import Foundation

let API_KEY = "94ce163f595c47f1a932bff06ff04900"
let API_URL = "http://103.18.7.212:32784/"

public enum ApiURI:String {
    case Login = "users/login"
    case Document = "docs"
    case ITsection = "postITs/categories"
    case SearchTitles = "postITs/categories/"
}
