//
//  ViewController.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/17/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit
import Alamofire

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
        AFWrapper.requestPOSTURL("http://103.18.7.212:32784/users/login", params: param, headers: ["Content-Type":"application/json"], success: { response in
            print(response)
            self.performSegue(withIdentifier: "pushToTabbar", sender: nil)
        }, failure: { error in
            print(error)
        })
    }

}

