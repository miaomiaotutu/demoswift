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
    var preBtn:UIButton?
    let shadowimage = UIImageView()
    
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
        self.topScrollview?.contentSize = CGSize(width: CGFloat(totalnumber!)*buttonWidth, height: 44)
        
        self.rootScrollview?.contentSize = CGSize(width: CGFloat(totalnumber!)*self.bounds.size.width, height: self.bounds.size.height-44)
        self.shadowimage.backgroundColor = UIColor.orange
        for index in 0...totalnumber!-1 {
            let controller = self.delegate?.slideswitchView!(self, viewoftab: index)
            controller?.view.frame = CGRect(x: CGFloat(index)*self.bounds.size.width, y: 0, width: self.bounds.size.width, height: self.bounds.size.height-44)
            self.rootScrollview?.addSubview((controller?.view)!)
            self.viewcontrollers?.append(controller ?? UIViewController())
            
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: CGFloat(index)*buttonWidth, y: 0, width: buttonWidth, height: 44)
            btn.setTitle(controller?.title, for: .normal)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.setTitleColor(UIColor.orange, for: .selected)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.titleLabel?.textAlignment = .center
            btn.backgroundColor = UIColor.lightGray
            btn.tag = 100+index
            btn.addTarget(self, action:#selector(btnclicked(_:)) , for: .touchUpInside)
            self.topScrollview!.addSubview(btn)
            if index == 0 {
                btn.isSelected = true
                self.preBtn = btn
                self.shadowimage.frame = CGRect(x: btn.frame.origin.x+10, y: btn.bounds.size.height-2, width: btn.bounds.size.width-20, height: 2)
                self.topScrollview?.addSubview(self.shadowimage)

            }
        }
    }
    func btnclicked(_ btn:UIButton) {
        self.adjustButton(btn)
        self.preBtn?.isSelected = false
        btn.isSelected = !btn.isSelected
        self.preBtn = btn
        UIView.animate(withDuration: 0.25, animations: { 
            self.shadowimage.frame = CGRect(x: btn.frame.origin.x+10, y: btn.bounds.size.height-2, width: btn.bounds.size.width-20, height: 2)
            self.topScrollview?.addSubview(self.shadowimage)
        }) { (finished) in
            self.rootScrollview?.setContentOffset(CGPoint(x: CGFloat(btn.tag-100)*self.bounds.size.width, y: 0), animated: true)
        }
        
        
    }
    func adjustButton(_ tempbtn:UIButton) {
        if tempbtn.frame.origin.x-(self.topScrollview?.contentOffset.x)! > self.bounds.size.width-tempbtn.bounds.size.width {
            self.topScrollview?.setContentOffset(CGPoint(x:tempbtn.frame.origin.x-self.bounds.size.width+tempbtn.bounds.size.width, y: 0), animated: true)
        }
        if tempbtn.frame.origin.x - (self.topScrollview?.contentOffset.x)! < 0 {
            self.topScrollview?.setContentOffset(CGPoint(x:tempbtn.frame.origin.x, y: 0), animated: true)
        }
        
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("Decelerating"+"\(scrollView.contentOffset.x)")
        if scrollView == self.rootScrollview {
            let tag = scrollView.contentOffset.x/self.bounds.size.width
            let tempbtn = self.topScrollview?.viewWithTag(Int(tag+100)) as! UIButton
            self.btnclicked(tempbtn)
        }

    }
    
}
