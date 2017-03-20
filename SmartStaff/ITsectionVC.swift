//
//  ITsectionVC.swift
//  SmartStaff
//
//  Created by Admin on 3/21/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit

class ITsectionVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var sections = ["iOS","Android","Ruby",".NET","Python","Java","Javascript"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibName = UINib(nibName: "ITsectionCell", bundle:nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "ITsectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
  

}
