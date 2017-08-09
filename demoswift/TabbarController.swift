//
//  TabbarController.swift
//  demoswift
//
//  Created by lyscds2017 on 2017/7/12.
//  Copyright © 2017年 miaojinliang. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tab1 = FirstController.init()
        tab1.age = 26
        tab1.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "")?.withRenderingMode(.alwaysOriginal))
        
        let nav1 = UINavigationController.init(rootViewController: tab1)
        let tab2 = SecondController.init()
        
        let nav2 = UINavigationController.init(rootViewController: tab2)

        self.setViewControllers([nav1,nav2], animated: true)
        let tabbar = self.tabBar
        
        let tabbar1 = tabbar.items?[0]
        let tabbar2 = tabbar.items?[1]
        tabbar1?.title = "首页"
        tabbar1?.image = UIImage.init(named: "mjladd")?.withRenderingMode(.alwaysOriginal)
        tabbar1?.selectedImage = UIImage.init(named: "mjlreduce")?.withRenderingMode(.alwaysOriginal)
        tabbar2?.title = "我的"

        tabbar2?.image = UIImage.init(named: "mjl_caigou_normal")?.withRenderingMode(.alwaysOriginal)
        tabbar2?.selectedImage = UIImage.init(named: "mjl_caigou_selected")?.withRenderingMode(.alwaysOriginal)

        
    }
}
