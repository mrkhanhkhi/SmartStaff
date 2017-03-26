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

class NewsVC: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var articles = [[String:String]]()
    var filteredNews = [[String:String]]()
    lazy var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 250, height: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "newsCell")
        tableView.dataSource = self
        tableView.delegate = self
        fetchArticles()
        drawNavBarUI(navigationItem: self.navigationItem)
        // Do any additional setup after loading the view.
    }
    
    func fetchArticles() {
        AFWrapper.requestGETURL(API_URL, success: {
            (JSONResponse) -> Void in
            print(JSONResponse)
            self.parseJSON(json: JSONResponse)
            if self.articles.count > 0 {
                self.tableView.reloadData()
            }
        }) {
            (error) -> Void in
            print(error)
        }
    }
    
    func parseJSON(json:JSON) {
        for result in json["articles"].arrayValue {
            let title = result["title"].stringValue
            let author = result["author"].stringValue
            let urlToImage = result["urlToImage"].stringValue
            let url = result["url"].stringValue
            let articleObj = ["title": title, "author": author, "urlToImage": urlToImage,"url":url]
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
        var dict = articles[indexPath.row]
        if let imgURl = dict["urlToImage"] {
            cell.thumbImage.sd_setImage(with: URL(string: imgURl), placeholderImage:nil)
        }
        cell.titleLabel.text = dict["title"]
        cell.sourceLabel.text = dict["author"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var dict = articles[indexPath.row]
        if let articleUrl = dict["url"] {
            let webViewController = WebViewVC()
            webViewController.ulr = articleUrl
        self.navigationController?.pushViewController(webViewController, animated: true)
        }
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercased()
            let searchPredicate = NSPredicate(format: "title CONTAINS[C] %@", lower)
            filteredNews = (self.articles as NSArray).filtered(using: searchPredicate) as! [[String : String]]
            tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }


}
