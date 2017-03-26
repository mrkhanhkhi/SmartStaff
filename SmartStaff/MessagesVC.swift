//
//  MessagesVC.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/24/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit

class MessagesVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var authors = ["Nguyen Tan Minh","Nguyen Hoang Tuan","Vu Minh Hoa"]
    var createDate = ["21/02/2017","06/03/2017","07/01/2017","28/12/2016","29/11/2016","11/11/2016","18/12/2016"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBarColor(navigationController: self.navigationController!)
        tableView.register(UINib(nibName: "MessagesCell", bundle: nil), forCellReuseIdentifier: "MessagesCell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return authors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessagesCell", for: indexPath) as! MessagesCell
        cell.fromLabel.text = authors[indexPath.row]
        let image = UIImage(named: authors[indexPath.row])
        cell.authorImg?.image = image
        cell.authorImg?.layer.cornerRadius = (cell.authorImg?.frame.size.width)! / 2
        cell.authorImg?.layer.masksToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

