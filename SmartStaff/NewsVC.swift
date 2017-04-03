//
//  NewsVC.swift
//  SmartStaff
//
//  Created by Admin on 3/20/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import KeychainAccess

class NewsVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{

    @IBOutlet weak var tableView: UITableView!
    var articles = [NewsArticle]()
    var filteredNews = [[String:String]]()
    var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 250, height: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "newsCell")
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        fetchArticles()
        drawNavBarUI(navigationItem: self.navigationItem)
        // Do any additional setup after loading the view.
    }
    
    func drawNavBarUI(navigationItem:UINavigationItem) {
        let bookmarkBtn = UIButton(type: .custom)
        bookmarkBtn.setImage(UIImage(named: "bookmark"), for: .normal)
        bookmarkBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let item1 = UIBarButtonItem(customView: bookmarkBtn)
        navigationItem.setRightBarButtonItems([item1,UIBarButtonItem(customView:searchBar)], animated: true)
    }
    
    func fetchArticles() {
        let keychain = Keychain(server: API_URL, protocolType: .https)
        let authCode = keychain["authCode"]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "authcode": authCode!
        ]
        print(authCode!)
        Alamofire.request(API_URL_NEWS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (JSONResponse) -> Void in
            print(JSONResponse)
            if JSONResponse.result.isSuccess {
                let response = JSON(JSONResponse.result.value!)
                self.parseJSON(json: response)
                if self.articles.count > 0 {
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
            let category = result["category"].stringValue
            let image = result["image"].stringValue
            let id = result["id"].stringValue
            let body = result["body"].stringValue
            let createTime = result["createTime"].stringValue
            let articleObj = NewsArticle(title: title, body: body, category: category, image: image, id: id, createTime:createTime)
            articles.append(articleObj)
        }
        tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
        let article:NewsArticle!
        article = articles[indexPath.row]
        cell.configureCell(article: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       /* var dict = articles[indexPath.row]
        if let articleUrl = dict["url"] {
            let webViewController = WebViewVC()
            webViewController.ulr = articleUrl
        self.navigationController?.pushViewController(webViewController, animated: true)
        }*/
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let param:Parameters = ["size":8,"page":0]
        let keychain = Keychain(server: API_URL, protocolType: .https)
        let authCode = keychain["authCode"]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "authcode": authCode!
        ]
        Alamofire.request(API_URL_SEARCH_ARTICLES, method: .get, parameters: ["title":searchBar.text!], encoding: JSONEncoding.default, headers: headers).responseJSON { (JSONResponse) -> Void in
            print(JSONResponse)
            if JSONResponse.result.isSuccess {
                let response = JSON(JSONResponse.result.value!)
                self.articles.removeAll()
                self.parseJSON(json: response)
            } else {
                let error : Error = JSONResponse.result.error!
                print(error)
            }
            
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        view.endEditing(true)
    }


}
