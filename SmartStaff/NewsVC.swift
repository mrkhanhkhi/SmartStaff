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

class NewsVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var articles = [[String:AnyObject]]()
    var titles:[String] = []
    var authors:[String] = []
    var articleURLs:[String] = []
    var imgURLs:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "newsCell")
        tableView.dataSource = self
        tableView.delegate = self
        fetchArticles()
        // Do any additional setup after loading the view.
    }
    
    func fetchArticles() {
        Alamofire.request(API_URL).responseJSON { response in
            if let value = response.result.value {
                let json = JSON(value)
                if let articleData = json["articles"].arrayObject {
                    self.articles = articleData as! [[String:AnyObject]]
                }
                if self.articles.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
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
        if let imgURl = dict["urlToImage"] as? String {
            cell.thumbImage.sd_setImage(with: URL(string: imgURl), placeholderImage:nil)
        }
        cell.titleLabel.text = dict["title"] as? String
        cell.sourceLabel.text = dict["author"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}
