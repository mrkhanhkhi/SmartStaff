//
//  User.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/27/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User {
    var authCode:String
    var birthday:CLong
    var email:String
    var workedAt: CLong
}

extension User {
    init (json:SwiftyJSON.JSON) {
        self.authCode = json["authcode"].string!
        self.birthday = json["birthday"].int!
        self.email = json["email"].string!
        self.workedAt = json["worked_at"].int!
    }
}
