//
//  ProductItemView.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/15.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class ProductItemView: UIView {

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
        //layer.masksToBounds = true

        // 商品画像
        let margin:CGFloat = 5
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        imageView.frame = CGRect(x: margin, y: margin, width: frame.width - margin * 2, height: frame.height - margin * 2)
        addSubview(imageView)
        
        // カウンター
        let height  = frame.height / 3
        let counterView = UIView(frame: CGRect(x: 0, y: height * 2, width: frame.width, height: height))
        counterView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        counterView.layer.cornerRadius = 4
        //counterView.layer.masksToBounds = true
        addSubview(counterView)
        
        let label = UILabel(frame: CGRect(x: 0, y:-40, width: frame.width, height: height + 60))
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "100"
        label.baselineAdjustment = .alignCenters
        counterView.addSubview(label)
        
        
        let attrText = NSMutableAttributedString(string: "120")
        attrText.addAttributes([NSBaselineOffsetAttributeName:-10], range: NSMakeRange(2, 1))
        attrText.addAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: 60)], range: NSMakeRange(2, 1))
        attrText.addAttributes([NSStrokeWidthAttributeName: -5] ,range: NSMakeRange(2, 1))
        attrText.addAttributes([NSStrokeColorAttributeName: UIColor.black], range: NSMakeRange(2, 1))
        label.attributedText = attrText
        
    }

    func setCounter(count: Int){
        
        
    }
    
}
