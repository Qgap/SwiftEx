//
//  ViewController.swift
//  Demo
//
//  Created by gap on 2017/10/25.
//  Copyright © 2017年 gap. All rights reserved.
//

import UIKit
import AFNetworking

class ViewController: UIViewController {

    var button:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button = UIButton.init(type: .custom)
        self.button.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        self.button.setTitle("hello swift", for: UIControlState.normal)
        self.button.setTitleColor(UIColor.red, for: UIControlState.normal)
        self.button.addTarget(self, action: #selector(push), for: UIControlEvents.touchUpInside)
        self.view.addSubview(self.button)
        
    }
    
    @objc func push() {
    
//        let vc = ThreeViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//        vc.myBlock = {(name:String) in
//            self.button.setTitle(name, for: UIControlState.normal)
//        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

