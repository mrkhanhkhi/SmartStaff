//
//  DocumentsVC.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/24/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage
import KeychainAccess
import Alamofire

class DocumentsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var documents = [[String:String]]()
    var createDate = ["21/02/2017","06/03/2017","07/01/2017","28/12/2016","29/11/2016","11/11/2016","18/12/2016"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "DocumentsCell", bundle: nil), forCellReuseIdentifier: "documentsCell")
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
        Alamofire.request(API_URL_DOCUMENT, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (JSONResponse) -> Void in
            print(JSONResponse)
            if JSONResponse.result.isSuccess {
                let response = JSON(JSONResponse.result.value!)
                self.parseJSON(json: response)
                if self.documents.count > 0 {
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
            let title = result["title"].stringValue
            let link = result["link"].stringValue
            let id = result["id"].stringValue
            let documentObj = ["title": title, "link": link, "id":id]
            documents.append(documentObj)
        }
        tableView.reloadData()
    }


    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "documentsCell", for: indexPath) as! DocumentsCell
        var dict = documents[indexPath.row]
        cell.fileNameLabel.text = dict["title"]
        cell.createDateLabel.text = dict["link"]
        cell.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
