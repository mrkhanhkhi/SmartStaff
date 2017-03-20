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

    @IBAction func sectionButtonTapped(sender: UIButton) {
        switch sender.tag {
        case 1:
            let newsVC = NewsVC()
            self.navigationController?.pushViewController(newsVC, animated: true)
            break
        case 2:
            let itSectionsVC = ITsectionVC()
            self.navigationController?.pushViewController(itSectionsVC, animated: true)
            break
        case 3:
            let itSectionsVC = ITsectionVC()
            self.navigationController?.pushViewController(itSectionsVC, animated: true)
            break
        case 4:
            let itSectionsVC = ITsectionVC()
            self.navigationController?.pushViewController(itSectionsVC, animated: true)
            break
        default:
            let itSectionsVC = ITsectionVC()
            self.navigationController?.pushViewController(itSectionsVC, animated: true)
            break
        }

    }

}
