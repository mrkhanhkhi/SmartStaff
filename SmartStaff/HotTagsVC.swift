//
//  HotTagsVC.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/24/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import KeychainAccess

class HotTagsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var hotTags = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "HotTagsCell", bundle: nil), forCellReuseIdentifier: "hotTagsCell")
        tableView.delegate = self
        tableView.dataSource = self
        fetchArticles()
        // Do any additional setup after loading the view.
    }
    
    func fetchArticles() {
        let param:Parameters = ["size":8,"page":0]
        let keychain = Keychain(server: API_URL, protocolType: .https)
        let authCode = keychain["authCode"]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "authcode": authCode!
        ]
        print(authCode!)
        Alamofire.request("http://103.18.7.212:32784/postITs/hotkeys", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (JSONResponse) -> Void in
            print(JSONResponse)
            if JSONResponse.result.isSuccess {
                let response = JSON(JSONResponse.result.value!)
                self.parseJSON(json: response)
                if self.hotTags.count > 0 {
                    self.tableView.reloadData()
                }
            } else {
                let error : Error = JSONResponse.result.error!
                print(error)
            }
            
        }
    }
    
    func parseJSON(json:JSON) {
        for result in json["content"].arrayValue {
            let id = result["id"].stringValue
            let word = result["word"].stringValue
            let total = result["total"].intValue
            let hotTagObj = ["id": id, "total": total, "word": word] as [String : Any]
            hotTags.append(hotTagObj)
        }
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotTags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotTagsCell", for: indexPath) as! HotTagsCell
        var dict = hotTags[indexPath.row]
        cell.tagLabel.text = dict["word"] as! String?
        cell.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
        return cell
    }


}
