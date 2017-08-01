//
//  MJLSlideSwitchView.swift
//  demoswift
//
//  Created by lyscds2017 on 2017/7/29.
//  Copyright © 2017年 miaojinliang. All rights reserved.
//

import UIKit
let screen_width = UIScreen.main.bounds.size.width
let screen_height = UIScreen.main.bounds.size.height

@objc protocol SlideSwitchViewDelegate{
      @objc optional func slideswitchView(_ view:MJLSlideSwitchView,viewoftab:Int) -> UIViewController
      @objc optional func numberOfTab(_ view:MJLSlideSwitchView) -> Int
}


class MJLSlideSwitchView: UIView,UIScrollViewDelegate {
    var delegate:SlideSwitchViewDelegate?
    var topScrollview:UIScrollView?
    var rootScrollview:UIScrollView?
    var viewcontrollers:Array<Any>?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        self.topScrollview = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: 44))
        self.topScrollview?.showsVerticalScrollIndicator = false
        self.topScrollview?.showsHorizontalScrollIndicator = false
        self.topScrollview?.bounces = false
        self.topScrollview?.delegate = self
        self.addSubview(self.topScrollview!)
        
        self.rootScrollview = UIScrollView(frame: CGRect(x: 0, y: 44, width: self.bounds.size.width, height: self.bounds.size.height-44))
        self.rootScrollview?.showsVerticalScrollIndicator = false
        self.rootScrollview?.showsHorizontalScrollIndicator = false
        self.rootScrollview?.bounces = false
        self.rootScrollview?.delegate = self
        self.rootScrollview?.isPagingEnabled = true
        self.addSubview(self.rootScrollview!)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func buildUIWithVisibleItem(item:Int) {
        let totalnumber = self.delegate?.numberOfTab!(self)
        
        let buttonWidth = self.bounds.size.width/CGFloat(item)

        for index in 0...totalnumber!-1 {
            let controller = self.delegate?.slideswitchView!(self, viewoftab: index)
            controller?.view.frame = CGRect(x: CGFloat(index)*self.bounds.size.width, y: 0, width: self.bounds.size.width, height: self.bounds.size.height-44)
            self.rootScrollview?.addSubview((controller?.view)!)
            self.viewcontrollers?.append(controller ?? UIViewController())
            
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: CGFloat(index)*buttonWidth, y: 0, width: buttonWidth, height: 44)
            btn.setTitle(controller?.title, for: .normal)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.titleLabel?.textAlignment = .center
            btn.backgroundColor = UIColor.lightGray
            btn.tag = 100+index
            btn.addTarget(self, action: Selector(("btnclicked:")), for: .touchUpInside)
            self.topScrollview!.addSubview(btn)
        }
        self.topScrollview?.contentSize = CGSize(width: CGFloat(totalnumber!)*buttonWidth, height: 44)

        self.rootScrollview?.contentSize = CGSize(width: CGFloat(totalnumber!)*self.bounds.size.width, height: self.bounds.size.height-44)

        
    }
    func btnclicked(btn:UIButton) {
        
    }
       func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
}
