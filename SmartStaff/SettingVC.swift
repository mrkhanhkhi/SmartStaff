//
//  SettingVC.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/24/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var popUpSettingSwitch: UISwitch!
    @IBOutlet weak var pushNotifSettingSwitch: UISwitch!
    @IBOutlet weak var messageSettingSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBarColor(navigationController: self.navigationController!)
        if let isDisplayPopUpOnHomeScr:Bool = defaults.value(forKey: "isDisplayPopUpOnHomeScr") as! Bool?
        {
            if isDisplayPopUpOnHomeScr == true
            {
                popUpSettingSwitch.isOn = true
            }
            else
            {
                popUpSettingSwitch.isOn = false
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func popUpSwitchPressed(_ sender: Any) {
        if popUpSettingSwitch.isOn {
        defaults.set(true, forKey: "isDisplayPopUpOnHomeScr")
        defaults.synchronize()
        } else {
            defaults.set(false, forKey: "isDisplayPopUpOnHomeScr")
            defaults.synchronize()
        }
    }
}
