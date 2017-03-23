//
//  ITsectionVC.swift
//  SmartStaff
//
//  Created by Admin on 3/21/17.
//  Copyright © 2017 Nguyen Duy Khanh. All rights reserved.
//

import UIKit

class ITsectionVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    let sections = ["iOS","Android","Ruby","dotNET","Python","Java","Javascript"]
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ITsectionCell", for: indexPath) as! ITsectionCell
        cell.sectionNameLabel.text = sections[indexPath.row]
        cell.sectionImg.image = UIImage(named: sections[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
  


