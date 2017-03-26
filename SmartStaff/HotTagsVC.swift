//
//  HotTagsVC.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/24/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit

class HotTagsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var hotTags = ["#iOS","#Android","#Javascript","#Swift","#Ruby","#.NET","#Z.com"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "HotTagsCell", bundle: nil), forCellReuseIdentifier: "hotTagsCell")
        tableView.delegate = self
        tableView.dataSource = self
        drawNavBarUI(navigationItem: self.navigationItem)
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotTags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotTagsCell", for: indexPath) as! HotTagsCell
        cell.tagLabel.text = hotTags[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
        return cell
    }


}
