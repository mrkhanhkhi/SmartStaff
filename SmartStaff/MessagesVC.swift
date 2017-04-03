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
    var messages = ["10h họp em nhé !","Trà đá không em ơi","Thông báo về việc chấm điểm dự án ABC.."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MessagesCell", bundle: nil), forCellReuseIdentifier: "MessagesCell")
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.barStyle = UIBarStyle.default
        navigationController?.navigationBar.tintColor = UIColor.red
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.red]
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
        cell.msgTitleLabel.text = messages[indexPath.row]
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

