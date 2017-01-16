//
//  ProductItemView.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/15.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class ProductItemView: UIView {

    var count = 100
    
    fileprivate var label: UILabel!
    
    fileprivate var numberImages:[UIImage] = []
    fileprivate var counterView: CounterView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect,image: UIImage) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        layer.cornerRadius = 8
        
        for i in 0 ..< 10 {
            let image = UIImage(named: "\(i)")
            numberImages.append(image!)
        }

        // 商品画像
        let margin:CGFloat = 5
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        imageView.frame = CGRect(x: margin, y: margin, width: frame.width - margin * 2, height: frame.height - margin * 2)
        addSubview(imageView)
        
        // カウンター
        let height  = frame.height / 3
        counterView = CounterView(frame: CGRect(x: 0, y: height * 2, width: frame.width, height: height))
        counterView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        counterView.layer.cornerRadius = 4
        addSubview(counterView)
        
    }
    func incrementCounter(){
        count += 1
        if count >= 1000 {
            count = 500
        }
        counterView.setNum(num: count)
    }
}
