//
//  DetailVC.swift
//  Demo
//
//  Created by gap on 2017/11/7.
//  Copyright © 2017年 gap. All rights reserved.
//

import UIKit
import AFNetworking
import ObjectMapper
import SwiftyJSON

class DetailVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var tableView:UITableView!
    var dataArray:[CityModel] = []
    static let cellId = "RusedId"
    var sessionManager = AFHTTPSessionManager.init()
    var searchWord:String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if dataArray.count == 0 {
            self.sessionManager = AFHTTPSessionManager.init(baseURL: URL.init(string: "http://ali-city.showapi.com"))
            let appcode = "5afe0d6397a348558ce8c64f4c93097a"
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            self.sessionManager.requestSerializer.setValue(String.init(format: "APPCODE %@", appcode), forHTTPHeaderField: "Authorization")
            self.sessionManager.get("/areaName", parameters: ["areaName":self.searchWord], progress: { (progress) in
                
            }, success: { (task, response) in
                 UIApplication.shared.isNetworkActivityIndicatorVisible = false
                let json = JSON(response as! [String:Any])
                let array = json["showapi_res_body"]["data"].arrayObject
                if array == nil {
                    print("error")
                    return
                }
                
                for values in array! {
                    let model = Mapper<CityModel>().map(JSONObject: values)
                    self.dataArray.append(model!)
                    print("model name +\(model?.areaName ?? "error")")
                }
                
                self.tableView.reloadData()
                
            }, failure: { (task, error) in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                print(error.localizedDescription)
            })
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CityCell.init(style: UITableViewCellStyle.default, reuseIdentifier: DetailVC.cellId)
        if self.dataArray.count > indexPath.row {
            cell.setupData(model: dataArray[indexPath.row])
            cell.clousre = { (sender:UIButton) ->() in
                let id = sender.currentTitle
                self.sessionManager.get("areaDetail", parameters: ["parentId":id], progress: { (progress) in
                    
                }, success: { (task, response) in
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    print(response)
                    self.dataArray.removeAll()
                    
                    let json = JSON(response)
                    let array = json["showapi_res_body"]["data"].arrayObject
                    if array != nil {
                        for values in array! {
                            let model = Mapper<CityModel>().map(JSONObject: values)
                            print(model?.areaName)
                            self.dataArray.append(model!)
                            self.tableView.reloadData()
                        }
                    }                    
                }, failure: { (task, error) in
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    print(error.localizedDescription)
                })
            }
        }
        
        return cell
    }
    
    func setupTableView() {
        self.tableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.grouped)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        self.tableView.register(CityCell.self, forCellReuseIdentifier: DetailVC.cellId)
        self.view.addSubview(self.tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
