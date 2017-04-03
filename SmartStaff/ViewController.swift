//
//  ViewController.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/17/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import KeychainAccess

class ViewController: UIViewController {
    
    let service = "Login"
    let userAccount = "SmartStaffUser"
    let key = "RandomKey"

    @IBOutlet weak var passwordTf: HoshiTextField!
    @IBOutlet weak var userNameTf: HoshiTextField!
    @IBOutlet weak var savePasswordBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        savePasswordBtn.setImage(UIImage(named: "login_checkbox_unchecked"), for: .normal)
        savePasswordBtn.setImage(UIImage(named: "login_checkbox_checked"), for: .selected)
        let keychain = Keychain(service: "SmartStaffID")
        if let savedPW = keychain["password"] {
            passwordTf.text = savedPW
            
            if let savedUser = keychain["username"] {
                userNameTf.text = savedUser
            }
            savePasswordBtn.isSelected = true
        } else {
            savePasswordBtn.isSelected = false
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        let param:Parameters = ["username":userNameTf.text!,"password":passwordTf.text!]
        Alamofire.request(UserRouter.Login(param)).responseJSON { response in
            guard response.result.error == nil else {
                // got an error in getting the data, need to handle it
                print(response.result.error!)
                return
            }
            
            if let value: AnyObject = response.result.value as AnyObject? {
                // handle the results as JSON, without a bunch of nested if loops
                print(value)
                let user = JSON(value)
                if let authCode = user["staff"]["authcode"].string {
                    print(authCode)
                    let keychain = Keychain(server: API_URL, protocolType: .https)
                    keychain["authCode"] = authCode
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let tabbarVC = storyBoard.instantiateViewController(withIdentifier: "TabbarVC") as! TabbarVC
                    self.present(tabbarVC, animated:true, completion:nil)
                } else {
                    print("error detected")
                }
                }
            }
        }
    
    @IBAction func saveUserPassword(_ sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected = true
        } else {
        let keychain = Keychain(service: "SmartStaffID")
        keychain["username"] = userNameTf.text
        keychain["password"] = passwordTf.text
    }
    
    func checkUserInfoFilled() {
    }
}
}

