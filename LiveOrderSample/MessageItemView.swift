//
//  MessageItemView.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/12.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class MessageItemView: UILabel {


    fileprivate var superFrame: CGRect!
    var lineHeight:CGFloat = 0
    var lineWidth :CGFloat = 0
    var lineMargin: CGFloat = 3 // 各メッセージの上下余白
    var leftMargin: CGFloat = 15 // 各メッセージの左余白
    var isVisible = false
    var position = 0 // 親フレームの下
    var titleWidth: CGFloat = 0

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    convenience init(frame: CGRect, lineHeight: CGFloat, name:String){
        self.init(frame: frame)
        
        superFrame = frame
        self.lineHeight = lineHeight
        lineWidth = superFrame.width - leftMargin

        backgroundColor = UIColor.white
        layer.cornerRadius = 5
        clipsToBounds = true
        font = font.withSize(12)
        
        move(position:position)
        
        self.frame = CGRect(x: superFrame.origin.x + leftMargin, y: superFrame.height + lineMargin, width: lineWidth, height: lineHeight - lineMargin * 2)
    }
    
    func up() {
        self.up(name:nil ,color: UIColor.black, text: nil)
    }
    
    func up(name:String?, color:UIColor, text:String?){
        if text != nil {
            isVisible = true
            
            self.text = " \(name!) \(text!) "
            let attrText = NSMutableAttributedString(string: self.text!)
            attrText.addAttribute(NSForegroundColorAttributeName,
                                  value: color,
                                  range: NSMakeRange(1, name!.characters.count))
            attributedText = attrText
            
            let maxSize = CGSize(width: superFrame.width - leftMargin, height: lineHeight)
            titleWidth = self.sizeThatFits(maxSize).width

        }
        if isVisible {
            
            position += 1
            
            UIView.animate(withDuration: 0.3, animations: {
                self.move(position:self.position)
                //self.move(runk: 1)
            }, completion:  { finished in
                if self.frame.origin.y + self.lineHeight < 0 {
                    self.isVisible = false
                    self.position = 0
                    self.move(position: self.position)
                }
            })
        }
    }
    
    fileprivate func move(position: Int) {
        //let y = superFrame.height - CGFloat(position) * lineHeight
//        self.frame = CGRect(x: superFrame.origin.x + leftMargin, y: superFrame.height - CGFloat(position) * lineHeight, width: lineWidth, height: lineHeight - lineMargin * 2)
        self.frame = CGRect(x: superFrame.origin.x + leftMargin, y: superFrame.height - CGFloat(position) * lineHeight, width: titleWidth, height: lineHeight - lineMargin * 2)
    }
    
//    fileprivate func move(runk: Int) {
//        var newFrame = self.frame
//        newFrame.origin.y -= CGFloat(runk) * self.lineHeight
//        self.frame = newFrame
//    }
}
