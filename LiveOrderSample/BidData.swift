//
//  BidData.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/13.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class BidData {
    
    fileprivate let data = ["赤色を購入します。1,280円","Type-B 決めました。14,000円","青色を購入します。 20,000円","赤色を購入します。1,280円","赤色を購入します。1,280円"]
    fileprivate let sw = [false,false,true,false,false]
    
    fileprivate var index = -1
    
    func get() -> (String,Bool) {
        index += 1
        if data.count <= index {
            index = 0
        }
        return (data[index],sw[index])
    }
}

