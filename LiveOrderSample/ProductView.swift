//
//  ProductView.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/13.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class ProductView: UIView {

    let items:[ProductItemView] = []
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var width = 70
        var margin = 5
        var offset = margin
        for i in 0..<4 {
            let image = UIImage(named: "Product00\(i)");
            
            let item = ProductItemView(frame: CGRect(x: offset, y: 0, width: width, height: Int(frame.height)), image: image!)
            addSubview(item)
            
            //items.append(item)
            offset += width + margin
        }
        
        //isUserInteractionEnabled = false
        //clipsToBounds = true
//        for i in 0 ..< lineMax {
//            let item = MessageItemView(frame: frame, lineHeight: frame.height / CGFloat(lineMax-2),name: "index=\(i)")
//            item.text = "Index-\(i)"
//            items.insert(item, at: 0)
//            addSubview(item)
//        }
    }

    

}
