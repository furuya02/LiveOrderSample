//
//  AudienceData.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/13.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class AudienceData {
    
    fileprivate let data:[Int] = [1000,998,1002,1002,1003,998,1005,1002,1003,1002,998,1021,1020,1022,1023,1024,998,1024,1030,1034,1035,1034,1040,1040,1043,1047,1044,1040,1040]
    fileprivate var index = -1
    
    func get() -> Int {
        index += 1
        if data.count <= index {
            index = 0
        }
        return data[index]
    }
}
