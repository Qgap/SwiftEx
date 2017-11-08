//
//  ViewController.swift
//  Demo
//
//  Created by gap on 2017/10/25.
//  Copyright © 2017年 gap. All rights reserved.
//

import UIKit
import AFNetworking
import SwiftyJSON
import ObjectMapper

class ViewController: UIViewController {

    var button:UIButton!
    var askText = UITextField.init()
    var resultLabel = UILabel.init()
    var modelAarry = [CityModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.askText.frame = CGRect.init(x: 100, y: 100, width: 100, height: 30)
        self.askText.layer.borderColor = UIColor.black.cgColor
        self.askText.layer.borderWidth = 0.5
        self.view.addSubview(self.askText)
        
        self.button = UIButton.init(type: .custom)
        self.button.frame = CGRect.init(x: 100, y: 145, width: 100, height: 30)
        self.button.setTitle("hello swift", for: UIControlState.normal)
        self.button.setTitleColor(UIColor.red, for: UIControlState.normal)
        self.button.addTarget(self, action: #selector(push), for: UIControlEvents.touchUpInside)
        self.view.addSubview(self.button)
        
        self.resultLabel.frame = CGRect.init(x: 100, y: 300, width: 400, height: 30)
        self.resultLabel.layer.backgroundColor = UIColor.red.cgColor
        self.resultLabel.layer.borderWidth = 0.5
        self.view.addSubview(self.resultLabel)
        
    }
    
    @objc func push() {
        let detailVC = DetailVC()
        detailVC.searchWord = self.askText.text
        self.navigationController?.pushViewController(detailVC, animated: true)
        
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

