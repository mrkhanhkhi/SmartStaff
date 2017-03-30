//
//  GlobalUtilities.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/23/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit

public var inSearchMode = false

func drawNavBarUI(navigationItem:UINavigationItem) {
    let bookmarkBtn = UIButton(type: .custom)
    bookmarkBtn.setImage(UIImage(named: "bookmark"), for: .normal)
    bookmarkBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    let item1 = UIBarButtonItem(customView: bookmarkBtn)
    navigationItem.setRightBarButtonItems([item1], animated: true)
}

func setNavBarColor(navigationController:UINavigationController) {
    navigationController.navigationBar.barStyle = UIBarStyle.default
    navigationController.navigationBar.tintColor = UIColor.red
    navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.red]
}

