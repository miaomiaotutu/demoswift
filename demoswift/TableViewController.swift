//
//  TableViewController.swift
//  demoswift
//
//  Created by lyscds2017 on 2017/7/25.
//  Copyright © 2017年 miaojinliang. All rights reserved.
//

import UIKit
import Alamofire
class TableViewController: UITableViewController {
    var values = [Float]()
    var dict = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
       // self.tableView.tableHeaderView = UIView()此句代码在grouped无用
        self.tableView.tableFooterView = UIView()
        self.values = [1,1,1,1,1,1,1,1,8,10,0]
        
        Alamofire.request("https://api.500px.com/v1/photos", method: .get).responseJSON {
            response in
            guard let JSON = response.result.value else { return }
            print("JSON: \(JSON)")
        }
        self.dict = ["name":"miao","age":"26"]
        print(self.dict)
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.values.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        cell.didmjlvalue = self.values[indexPath.row]

        //cell.mjlvalue = self.values[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let test = TestController()
        self.navigationController?.pushViewController(test, animated: true)
        
    }
    deinit {
        NSLog("yixiaohui")
    }

}
