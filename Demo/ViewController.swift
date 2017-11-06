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
        
        let sessionManager = AFHTTPSessionManager.init(baseURL: URL.init(string: "http://ali-city.showapi.com"))
        let appcode = "5afe0d6397a348558ce8c64f4c93097a"
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        sessionManager.requestSerializer.setValue(String.init(format: "APPCODE %@", appcode), forHTTPHeaderField: "Authorization")
        sessionManager.get("/areaName", parameters: ["areaName":self.askText.text], progress: nil, success: { (task, response) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            let json = response as! Dictionary<String, Any>
            print(json)
            if json["showapi_res_code"] as! NSInteger == 0 {
                let dataArray = json["showapi_res_body"]
                print(dataArray)
            }
            
            
        }) { (task, error) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            print(error.localizedDescription)
        }
        
        
        
//        let sessionManager = AFHTTPSessionManager.init(baseURL: URL.init(string:"http://jisuznwd.market.alicloudapi.com/"))
//        let appcode = "5afe0d6397a348558ce8c64f4c93097a"
//        sessionManager.requestSerializer.setValue(String.init(format: "APPCODE %@", appcode), forHTTPHeaderField: "Authorization")
//        sessionManager.get("iqa/query", parameters: ["question":self.askText.text], progress: nil, success: { (task, response) in
//
//            let data:String = JSON(response)["msg"].stringValue
//            if data == "ok" {
//                self.resultLabel.text = JSON(response)["result"]["content"].stringValue
//            }
//
//            print(data)
//
//
//            print("response+ \(response)")
//
//        }) { (task, error) in
//            print(error.localizedDescription)
//        }
        
        
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

