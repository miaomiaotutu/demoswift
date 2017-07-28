//
//  TestController.swift
//  demoswift
//
//  Created by lyscds2017 on 2017/7/27.
//  Copyright © 2017年 miaojinliang. All rights reserved.
//
import UIKit

class TestController: UIViewController,UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let search = UISearchBar(frame: CGRect(x: 20, y: 100, width: 200, height: 44))
        search.delegate = self
        search.returnKeyType = .search
        search.showsCancelButton = true
        search.showsSearchResultsButton = true
        //search.showsBookmarkButton = true
        self.navigationItem.titleView = search
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        print(searchBar.text ?? "hahah")
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()

    }
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.frame)
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width/2.0, height: 135)
        let collect = CollectionController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(collect, animated: true)
        
    }
    
}
