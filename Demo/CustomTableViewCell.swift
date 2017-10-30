//
//  CustomTableViewCell.swift
//  Demo
//
//  Created by gap on 2017/10/27.
//  Copyright © 2017年 gap. All rights reserved.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {

    var showImage:UIImageView!
    var contentLabel:UILabel!
    var titlelFeild:UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
        
    }
    
    func setUpUI() {
        
        self.showImage = UIImageView.init()
        self.showImage.contentMode = UIViewContentMode.scaleAspectFit
        self.contentView.addSubview(self.showImage)
        
        self.contentLabel = UILabel.init()
        self.contentLabel.textColor = UIColor.red
        self.contentLabel.font = UIFont.systemFont(ofSize: 12)
        self.contentView.addSubview(self.contentLabel)
        
        self.titlelFeild = UITextField.init()
        self.titlelFeild.layer.borderColor = UIColor.black.cgColor
        self.titlelFeild.layer.borderWidth = 0.5
        self.titlelFeild.placeholder = "hahah"
        self.contentView.addSubview(self.titlelFeild)
        
        self.showImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top).offset(20)
            make.left.equalTo(self.contentView.snp.left).offset(15)
            make.height.equalTo(35)
            make.width.equalTo(35)
        }
        
        self.titlelFeild.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp.top).offset(5)
            make.left.equalTo(self.showImage.snp.right).offset(15)
            make.right.equalTo(self.contentView.snp.right).offset(-15)
            make.height.equalTo(20)
        }
        
        self.contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titlelFeild.snp.bottom).offset(5)
            make.right.equalTo(self.titlelFeild)
            make.left.equalTo(self.titlelFeild)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-5)
        }
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
