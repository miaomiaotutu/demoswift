//
//  BlockController.swift
//  demoswift
//
//  Created by lyscds2017 on 2017/7/25.
//  Copyright © 2017年 miaojinliang. All rights reserved.
//

import UIKit
typealias changUserName = (_ names:String) ->()

class BlockController: UIViewController,UITextFieldDelegate{
    var textfied:UITextField?
    var changText: changUserName?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        self.textfied = UITextField(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
        self.textfied?.borderStyle = .roundedRect
        self.textfied?.returnKeyType = .done
        self.textfied?.enablesReturnKeyAutomatically = true
        self.textfied?.delegate = self
        self.view.addSubview(self.textfied!)
        
        let pusButton: UIButton = UIButton(type: .custom)
        pusButton.frame = CGRect(x: 100, y: 220, width: 100, height: 80)
        pusButton.backgroundColor = UIColor.red
        self.view.addSubview(pusButton)
        pusButton.addTarget(self, action: #selector(pushClick), for: .touchUpInside)

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfied?.resignFirstResponder()
        return true
    }
    func pushClick()  {
        changText!((self.textfied?.text!)!)
        
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
