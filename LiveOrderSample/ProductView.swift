//
//  ProductView.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/13.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class ProductView: UIView {

    var items:[ProductItemView] = []
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let width = 70
        let margin = 5
        var offset = margin
        for i in 0..<4 {
            let image = UIImage(named: "Product00\(i)");
            
            let item = ProductItemView(frame: CGRect(x: offset, y: 0, width: width, height: Int(frame.height)), image: image!)
            addSubview(item)
            
            // プレゼン用初期値
            item.count = Int(arc4random() % 50) + 100
            item.incrementCounter()
            self.items.append(item)
            
            offset += width + margin
        }
    }
    
    func incrementCounter(index: Int){
        if 0 <= index && index < items.count {
            items[index].incrementCounter()
        }
    }
}
