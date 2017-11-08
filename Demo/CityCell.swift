//
//  CityCell.swift
//  Demo
//
//  Created by gap on 2017/11/7.
//  Copyright © 2017年 gap. All rights reserved.
//

import UIKit
import SnapKit



class CityCell: UITableViewCell {
    
    var wholeName:UILabel?
    var areaName:UILabel?
    var idBtn:UIButton?

    
    var clousre:((_ sender:UIButton) ->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
        
    }
    
    func setupData(model:CityModel) {
        self.wholeName?.text = model.wholeName
        self.areaName?.text = model.areaName
        self.idBtn?.setTitle(model.id, for: UIControlState.normal)
//        self.idBtn?.titleLabel?.text = model.id
    }
    
    func setupUI() {
        self.wholeName = UILabel.init()
        self.wholeName?.font = UIFont.systemFont(ofSize: 14)
        self.wholeName?.numberOfLines = 1
        self.wholeName?.textColor = UIColor.black
        self.wholeName?.textAlignment = NSTextAlignment.left
        self.contentView.addSubview(self.wholeName!)
        
        self.areaName = UILabel.init()
        self.areaName?.font = UIFont.systemFont(ofSize: 12)
        self.areaName?.textColor = UIColor.black
        self.areaName?.textAlignment = NSTextAlignment.left
        self.contentView.addSubview(self.areaName!)
        
        self.idBtn = UIButton.init(type: UIButtonType.custom)
        self.idBtn?.setTitle("id", for: UIControlState.normal)
        self.idBtn?.setTitleColor(UIColor.red, for: UIControlState.normal)
        self.idBtn?.addTarget(self, action: #selector(buttnAction(sender:)), for: UIControlEvents.touchUpInside)
        self.contentView.addSubview(self.idBtn!)
        
        self.wholeName?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.contentView.snp.top).offset(3)
            make.left.equalTo(self.contentView.snp.left).offset(15)
            make.right.equalTo(self.contentView.snp.right).offset(-15)
            make.height.equalTo(30)
        })
        
        self.areaName?.snp.makeConstraints({ (make) in
            make.top.equalTo((self.wholeName?.snp.bottom)!).offset(3)
            make.left.equalTo(self.contentView.snp.left).offset(15)
            make.right.equalTo((self.idBtn?.snp.left)!)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-5)
        })
     
        self.idBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo((self.wholeName?.snp.bottom)!).offset(3)
            make.left.equalTo((self.areaName?.snp.right)!)
            make.right.equalTo(self.contentView.snp.right).offset(-15)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-5)
        })
    }
    
    @objc func buttnAction(sender:UIButton) {
        if (clousre != nil) {
            self.clousre!(sender)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
