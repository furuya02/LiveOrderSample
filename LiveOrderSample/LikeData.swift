//
//  LikeData.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/13.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class LikeData {
    
    fileprivate let data:[Bool] = [false,false,false,true,true,false,false,false,false,true,true,true,true,true,false,false,false,false,false,false,false,true,true,true,false,false,false,false,false,false,true,true,true,true,true,true,false,false,false,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false,false,false,false]
    fileprivate var index = -1
    
    func get() -> Bool {
        index += 1
        if data.count <= index {
            index = 0
        }
        return data[index]
    }
}
