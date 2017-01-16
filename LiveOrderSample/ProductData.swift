//  ProductData.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/16.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class ProductData {
    
    fileprivate let data:[Int] = [-1,-1,-1,0,1,2,3,-1,-1,-1,-1,-1,0,-1,-1,-1,2,-1,0,-1,-1,-1,-1,-1,3,2,3,3,-1,-1,-1,-1]
    fileprivate var index = -1
    
    func get() -> Int {
        index += 1
        if data.count <= index {
            index = 0
        }
        return data[index]
    }
}

