//
//  SecondController.swift
//  demoswift
//
//  Created by lyscds2017 on 2017/7/12.
//  Copyright © 2017年 miaojinliang. All rights reserved.
//

import UIKit

class SecondController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow

        self.title = "我的"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("hahahha")
    }
}
