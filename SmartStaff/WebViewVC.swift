//
//  WebViewVC.swift
//  SmartStaff
//
//  Created by Admin on 3/21/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class WebViewVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var ulr:String?
    let articleList = ArticleList()
    var article:NewsArticle?
    var list : Results<ArticleList>!
    var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 250, height: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadHTMLString(ulr!, baseURL: nil)
        drawNavBarUI(navigationItem: self.navigationItem)
    }
    
    func drawNavBarUI(navigationItem:UINavigationItem) {
        let bookmarkBtn = UIButton(type: .custom)
        bookmarkBtn.setImage(UIImage(named: "bookmark"), for: .normal)
        bookmarkBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let item1 = UIBarButtonItem(image: #imageLiteral(resourceName: "favortie"), style: .done, target: self, action: #selector(saveFavoriteArticle))
        navigationItem.setRightBarButtonItems([item1,UIBarButtonItem(customView:searchBar)], animated: true)
    }
    
    func saveFavoriteArticle() {
        try! realm.write {
            articleList.articles.append(article!)
        }
        print(articleList)
    }

}
