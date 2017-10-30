//
//  ThreeViewController.swift
//  Demo
//
//  Created by gap on 2017/10/26.
//  Copyright © 2017年 gap. All rights reserved.
//

import UIKit

typealias callbackFunc = (_ text:String) -> Void

class ThreeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var textFeild:UITextField?
    var myBlock:callbackFunc?
    
    var tableView:UITableView!
    var dataArray = [String]()
    
//    static let cellReuse = "CellId"
    static let cellReuse = "Cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.textFeild = UITextField.init(frame: .init(x: 100, y: 300, width: 100, height: 100))
//        self.textFeild?.textColor = UIColor.red
//        self.textFeild?.placeholder = "hello world"
//        self.textFeild?.layer.backgroundColor = UIColor.gray.cgColor
//        self.textFeild?.layer.borderWidth = 0.5
//        self.view.addSubview(self.textFeild!)

        tableView = UITableView.init(frame: self.view.bounds, style:UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: ThreeViewController.cellReuse)
        self.view .addSubview(tableView);
        
        dataArray = ["hello","123","sss","11241","gap","gg"]
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if self.myBlock != nil {
            myBlock!((self.textFeild?.text)!)
        }
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomTableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: ThreeViewController.cellReuse)
        cell.contentLabel.text = dataArray[indexPath.row]
        return cell;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
