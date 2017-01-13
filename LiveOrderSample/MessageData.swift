//
//  MessageData.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/13.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class MessageData {
    
    fileprivate let data = ["こんにちは、これは良いですね！","良いですね","^^)/","ヽ(｀▽´)/　ぜひ欲しいデす","これは欲しいです","んっ","安いと思います！！！"]
    fileprivate let name = ["佐久間町のゴルゴ１４","Hapy","山田太郎","ClassMethod","大きな声では言えません","^^)","XXX"]
    fileprivate let color = [UIColor.red,UIColor.blue,UIColor.red,UIColor.yellow,UIColor.orange,UIColor.red,UIColor.green]
    fileprivate var index = -1
    
    func get() -> (String,String,UIColor) {
        index += 1
        if data.count <= index {
            index = 0
        }
        return (data[index],name[index],color[index])
    }
}

