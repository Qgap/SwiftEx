//
//  CityModel.swift
//  Demo
//
//  Created by gap on 2017/11/2.
//  Copyright © 2017年 gap. All rights reserved.
//

import UIKit
import ObjectMapper


class CityModel: Mappable {
    
    var id:String?
    var parentId:String
    var wholeName:String
    var prePinYin:String
    var countyId:String
    var level:NSInteger
    var pinYin:String
    var remark:String?
    var areaName:String!
    var simplePy:String!
    var lat:Float
    var provinceId:String!
    var simpleName:String
    var areaCode:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        parentId <- map["parentId"]
        wholeName <- map["wholeName"]
        prePinYin <- map["prePinYin"]
        countyId <- map["countyId"]
        level <- map["level"]
        pinYin <- map["pinYin"]
        remark <- map["remark"]
        areaName <- map["areaName"]
        simplePy <- map["simplePy"]
        lat <- map["lat"]
        provinceId <- map["provinceId"]
        simpleName <- map["simpleName"]
        areaCode <- map["areaCode"]
    }
    
}
