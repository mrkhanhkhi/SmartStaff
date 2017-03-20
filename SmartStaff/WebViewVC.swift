//
//  WebViewVC.swift
//  SmartStaff
//
//  Created by Admin on 3/21/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit

class WebViewVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var ulr:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: ulr!)
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.loadRequest(myURLRequest)
    }


}
