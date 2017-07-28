//
//  FirstController.swift
//  demoswift
//
//  Created by lyscds2017 on 2017/7/12.
//  Copyright © 2017年 miaojinliang. All rights reserved.
//

import UIKit
class FirstController: UIViewController {
    var contentLab:UILabel?
    
    var name: String?{
        
        willSet{
            
            //
            NSLog("==========")
            
        }
        didSet{
            
            NSLog("did set " + name!)
        }
        
    }
    var _age: Int?
    var age: Int? {
        get {
            return _age
        }
        set {
            _age = newValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        self.view.backgroundColor = UIColor.white
        
        let pusButton: UIButton = UIButton(type: .custom)
        pusButton.frame = CGRect(x: 100, y: 220, width: 100, height: 40)
        pusButton.backgroundColor = UIColor.red
        self.view.addSubview(pusButton)
        pusButton.setTitle("反向传值", for: .normal)
        pusButton.addTarget(self, action: #selector(pushClick), for: .touchUpInside)
        
        self.contentLab = UILabel(frame: CGRect(x: 100, y: 400, width: 100, height: 20))
        self.contentLab?.font = UIFont.systemFont(ofSize: 12.0)
        self.contentLab?.backgroundColor = UIColor.yellow
        let tap = UITapGestureRecognizer(target: self, action: #selector(haha))
        self.contentLab?.addGestureRecognizer(tap)
        self.contentLab?.isUserInteractionEnabled = true
        self.contentLab?.textAlignment = .center
        self.view.addSubview(self.contentLab!)

    }
    func haha() -> Void {
        let tab = TableViewController(style: .grouped)
        tab.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(tab, animated: true)
        
    }
    func pushClick()  {
        let blockvc = BlockController()
        blockvc.changText = { (names)->() in
self.contentLab?.text = names
        }
        blockvc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(blockvc, animated: true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
