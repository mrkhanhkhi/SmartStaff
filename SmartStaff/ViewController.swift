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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
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
            UserDefaults.standard.set(self.userNameTf.text!, forKey: "username")
            UserDefaults.standard.set(self.passwordTf.text!, forKey: "username")
    }
    
    func checkUserInfoFilled() {
    }
}


