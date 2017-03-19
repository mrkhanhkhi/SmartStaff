//
//  HomeVC.swift
//  SmartStaff
//
//  Created by Admin on 3/20/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let sections = ["Tin tức","IT","Từ khóa hot","Tài liệu","Ghim"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sectionButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newsVC = storyboard.instantiateViewController(withIdentifier: "NewsVC") as! NewsVC
        self.navigationController?.pushViewController(newsVC, animated: true)
    }

}
