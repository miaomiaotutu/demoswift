//
//  SlideController.swift
//  demoswift
//
//  Created by lyscds2017 on 2017/7/31.
//  Copyright © 2017年 miaojinliang. All rights reserved.
//

import UIKit

class SlideController: UIViewController {
    var Controllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view?.backgroundColor = UIColor.white
self.automaticallyAdjustsScrollViewInsets = false//very important
        let slideview = MJLSlideSwitchView(frame: CGRect(x: 0, y: 64, width: screen_width , height: screen_height-64))
        slideview.delegate = self
        self.view.addSubview(slideview)
        let titles = ["发现","我的","首页","看视频","打游戏","设置","生活","风景","山水","游泳"]
        
        for index in 0...9 {
            let tempcontroll = TempTabController()
            tempcontroll.title = titles[index]
            self.Controllers.append(tempcontroll)
            
        }
        slideview.buildUIWithVisibleItem(item: 4)

    }

}


extension SlideController:SlideSwitchViewDelegate{
    func slideswitchView(_ view: MJLSlideSwitchView, viewoftab: Int) -> UIViewController {
        return self.Controllers[viewoftab]
    }
    func numberOfTab(_ view: MJLSlideSwitchView) -> Int {
        return self.Controllers.count
    }
}

