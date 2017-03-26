//
//  DocumentsVC.swift
//  SmartStaff
//
//  Created by Nguyen Duy Khanh on 3/24/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit

class DocumentsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var documents = ["File 1","File 2","File 3","File 4","File 5","File 6","File 7"]
    var createDate = ["21/02/2017","06/03/2017","07/01/2017","28/12/2016","29/11/2016","11/11/2016","18/12/2016"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "DocumentsCell", bundle: nil), forCellReuseIdentifier: "documentsCell")
        tableView.delegate = self
        tableView.dataSource = self
        drawNavBarUI(navigationItem: self.navigationItem)
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "documentsCell", for: indexPath) as! DocumentsCell
        cell.fileNameLabel.text = documents[indexPath.row]
        cell.createDateLabel.text = createDate[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
