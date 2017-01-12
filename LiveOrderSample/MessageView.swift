//
//  MessageView.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/12.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

/**
 *  メッセージビュー
 */
class MessageView: UIView {
    
    let lock = NSLock()
    
    let lineMax = 6 // 上下に余分に配置するため、表示行数は6-2で4となる
    var items: [MessageItemView] = []
    
    var index = 0
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        isUserInteractionEnabled = false
        clipsToBounds = true
        
        for i in 0 ..< lineMax {
            let item = MessageItemView(frame: frame, lineHeight: frame.height / CGFloat(lineMax-2),name: "index=\(i)")
            item.text = "Index-\(i)"
            items.insert(item, at: 0)
            addSubview(item)
        }
    }
    
    func appned(name: String, color: UIColor, text: String){
        self.lock.lock()
        for i in 0 ..< lineMax {
            items[i].up()
        }
        items[index].up(name: name, color: color, text: text)
        index += 1
        if lineMax <= index {
            index = 0
        }
        self.lock.unlock()
    }
    
}
