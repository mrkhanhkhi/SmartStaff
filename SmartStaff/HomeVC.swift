//
//  HomeVC.swift
//  SmartStaff
//
//  Created by Admin on 3/20/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    let sections = ["Tin tức","IT","Từ khóa hot","Tài liệu","Ghim"]
    let defaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBarColor(navigationController: self.navigationController!)
        validationPopup()
    }
    
    func validationPopup() {
        if let isDisplayPopUpOnHomeScr:Bool = defaults.value(forKey: "isDisplayPopUpOnHomeScr") as! Bool?
        {
            if isDisplayPopUpOnHomeScr == true
            {
                displayAlertView()
            }
            else
            {
                print("No popup")
            }
        }
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
            let hotTagsVC = HotTagsVC()
            self.navigationController?.pushViewController(hotTagsVC, animated: true)
            break
        case 4:
            let documentsVC = DocumentsVC()
            self.navigationController?.pushViewController(documentsVC, animated: true)
            break
        default:
            let bookmarkVC = BookmarksVC()
            self.navigationController?.pushViewController(bookmarkVC, animated: true)
            break
        }
    }
    
    func displayAlertView() {
        let alertController = UIAlertController(title: "Thông báo", message: "Bạn có tin nhắn mới", preferredStyle: UIAlertControllerStyle.alert)
        let DestructiveAction = UIAlertAction(title: "Để sau", style: UIAlertActionStyle.cancel) {
            (result : UIAlertAction) -> Void in
        }
        
        // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
        let okAction = UIAlertAction(title: "Đến xem", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            self.tabBarController?.selectedIndex = 2
        }
        
        alertController.addAction(DestructiveAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
