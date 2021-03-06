//
//  OrderView.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/13.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class OrderView: UIView {

    fileprivate let height = 200
    var imageViews: [UIImageView] = []

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!

        // Autolayout無効
        translatesAutoresizingMaskIntoConstraints = true
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        frame = CGRect(x: 0, y: Int(UIScreen.main.bounds.height), width: Int(UIScreen.main.bounds.width), height: height)

        // ScrollViewの検索と、イメージの追加
        for view in self.subviews {
            if view is UIScrollView {
                setImage(scrollView: view as! UIScrollView)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func fadeIn() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.frame = CGRect(x: 0, y: Int(UIScreen.main.bounds.height) - self.height, width: Int(UIScreen.main.bounds.width), height: self.height)
        }, completion: nil)
    }

    func fadeOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.frame = CGRect(x: 0, y: Int(UIScreen.main.bounds.height), width: Int(UIScreen.main.bounds.width), height: self.height)
        }, completion: { finished in
            for image in self.imageViews {
                image.alpha = 1;
            }
        })
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let index = (touches.first?.view?.tag)!
        if index != 0 {
            let orgFrame = self.imageViews[index-1].frame
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                let newFrame = CGRect(x: orgFrame.origin.x-20, y: orgFrame.origin.y - 20, width: orgFrame.width + 40, height: orgFrame.height + 40)
                self.imageViews[index-1].frame = newFrame
                self.imageViews[index-1].layer.borderWidth = 8;
                for (i,image) in self.imageViews.enumerated() {
                    if index - 1 != i {
                        image.alpha = 0;
                    }
                }
            }, completion: { finished in
                self.fadeOut()
                self.imageViews[index-1].frame = orgFrame
                self.imageViews[index-1].layer.borderWidth = 0;
            })
        }
    }
    
    fileprivate func setImage(scrollView: UIScrollView) {

        let contentView = UIView()
        let baseSize: CGFloat = 110
        let space: CGFloat = 20
        var offSet: CGFloat = space
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        
        for i in 0..<4 {
            let image = UIImage(named: "Product00\(i)");
            let imageView = UIImageView(image: image)
            let size = image?.size
            if Int((size?.width)!) < Int((size?.height)!) { // portrait
                let width = baseSize * ((size?.width)! / (size?.height)!)
                imageView.frame = CGRect(x: offSet, y: space, width: width, height: baseSize)
                offSet += width + space
            }
            else { // landscape
                let height = baseSize * ((size?.height)! / (size?.width)!)
                imageView.frame = CGRect(x: offSet, y: space + (baseSize - height)/2, width: baseSize, height: height)
                offSet += baseSize + space;
            }
            imageView.isUserInteractionEnabled = true // イメージビューはイベントを受け取る
            imageView.tag = i+1; // デフォルト値の0と区別するためにindex値は1以上とする
            imageView.layer.borderColor = UIColor.red.cgColor
            imageView.layer.cornerRadius = 8
            imageView.layer.masksToBounds = true
            contentView.addSubview(imageView)
            imageViews.append(imageView)
        }
        scrollView.addSubview(contentView)
        contentView.frame = CGRect(x: 0, y: 0, width: offSet, height: baseSize + space * 2);
        scrollView.contentSize = contentView.frame.size;
    }
}

// タッチイベントをイメージビューに送るためにUIIcroolViewを拡張する
class PassTouchesScrollView:UIScrollView {
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesEnded(touches, with: event)
    }
}
