//
//  ITsectionVC.swift
//  SmartStaff
//
//  Created by Admin on 3/21/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage
import KeychainAccess
import Alamofire

class ITsectionVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var sections = [Sections]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibName = UINib(nibName: "ITsectionCell", bundle:nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "ITsectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        fetchSections()
        // Do any additional setup after loading the view.
    }
    
    func fetchSections() {
        let param:Parameters = ["size":8,"page":0]
        let keychain = Keychain(server: "http://103.18.7.212:32784/", protocolType: .https)
        let authCode = keychain["authCode"]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "authcode": authCode!
        ]
        print(authCode!)
        Alamofire.request(API_URL_IT_SECTIONS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (JSONResponse) -> Void in
            print(JSONResponse)
            if JSONResponse.result.isSuccess {
                let response = JSON(JSONResponse.result.value!)
                self.parseJSON(json: response)
                if self.sections.count > 0 {
                    self.collectionView.reloadData()
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
            let image = result["image"].stringValue
            let name = result["name"].stringValue
            let sectionObj = Sections(name: name, title: title, image: image)
            sections.append(sectionObj)
        }
        collectionView.reloadData()
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ITsectionCell", for: indexPath) as! ITsectionCell
        var section:Sections!
        section = sections[indexPath.row]
        cell.configureCell(section: section)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
  


