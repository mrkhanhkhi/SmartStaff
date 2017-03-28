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
import Locksmith

class ViewController: UIViewController {

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
                print("error calling GET on /posts/1")
                print(response.result.error!)
                return
            }
            
            if let value: AnyObject = response.result.value as AnyObject? {
                // handle the results as JSON, without a bunch of nested if loops
                print(value)
                let user = JSON(value)
                if let authCode = user["staff"]["authcode"].string {
                    //At this point the user should have authenticated, store the session id and use it as you wish
                    print(authCode)
                } else {
                    print("error detected")
                }
                }
            }
        }
    
}


