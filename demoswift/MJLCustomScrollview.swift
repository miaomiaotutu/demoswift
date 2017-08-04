//
//  MJLCustomScrollview.swift
//  demoswift
//
//  Created by lyscds2017 on 2017/8/4.
//  Copyright © 2017年 miaojinliang. All rights reserved.
//

import UIKit

class MJLCustomScrollview: UIScrollView,UIGestureRecognizerDelegate{

//     func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool
//    {
//        print(gestureRecognizer,otherGestureRecognizer)
//        if (otherGestureRecognizer.view?.isKind(of: NSClassFromString("UITableViewWrapperView")!))! {
//            return true
//        }
//        return false
//    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool
    {
        if gestureRecognizer.state != .possible {
            return true
        }else{
            return false
        }
    }
}
