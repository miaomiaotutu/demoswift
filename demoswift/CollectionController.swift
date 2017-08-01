//
//  CollectionController.swift
//  demoswift
//
//  Created by lyscds2017 on 2017/7/28.
//  Copyright © 2017年 miaojinliang. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CollectionCell"

class CollectionController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.register(UINib.init(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionCell
        cell.icon.image = UIImage(named: "comment_profile_mars")
        cell.labTitle.text = "第"+"\(indexPath.row+1)"+"行"
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
        let controller = SlideController()
        self.navigationController?.pushViewController(controller, animated: true)
        
        
    }
   
}
