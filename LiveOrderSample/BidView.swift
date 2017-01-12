//
//  BidView.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/12.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

/**
 *  入札ビュー
 */
class BidView: UILabel {

    let label:UILabel = UILabel()
    var lineMargin: CGFloat = 3 // 上下余白
    var lineHeight:CGFloat = 30
    var lineWidth:CGFloat = 0
    var leftMargin: CGFloat = 15 // 左余白
    var baseFrame:CGRect!
    var hideFrame:CGRect!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        isUserInteractionEnabled = false
        //clipsToBounds = true
        
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.font = font.withSize(14)
        label.textColor = UIColor.white
        label.alpha = 0

        lineWidth = frame.width - leftMargin
        baseFrame = CGRect(x: leftMargin, y: lineMargin, width: lineWidth, height: lineHeight - lineMargin * 2)
        hideFrame = CGRect(x: leftMargin - lineWidth, y: lineMargin, width: lineWidth, height: lineHeight - lineMargin * 2)
        label.frame = baseFrame
        label.backgroundColor = UIColor.orange
        
        addSubview(label)
    }
    
    func appned(text: String, sw: Bool){
        label.text = text

        UIView.animate(withDuration: 0.3, animations: {
            self.label.alpha = 0
            self.label.backgroundColor = UIColor.orange
        }, completion: { finished in
            self.label.frame = self.hideFrame
            self.label.alpha = 0.8
            UIView.animate(withDuration: 0.3, animations: {
                self.label.frame = self.baseFrame
            }, completion: { finished in
                if sw {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.label.backgroundColor = UIColor.red
                    })
                }
            })
        })

    }
    
}
