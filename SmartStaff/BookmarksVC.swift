//
// BookmarksVC.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/24/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit
import RealmSwift

class BookmarksVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var list : Results<ArticleList>!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "BookmarkCell", bundle: nil), forCellReuseIdentifier: "bookmarkCell")
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let dict = list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarkCell", for: indexPath) as! BookmarkCell
        cell.titleLabel.text = dict.articles[indexPath.row].title
        return cell
        
    }
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
////        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (deleteAction, indexPath) -> Void in
////    
////        }
////        let editAction = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "Edit") { (editAction, indexPath) -> Void in
////
////        }
//    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
