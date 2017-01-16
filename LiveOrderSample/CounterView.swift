//
//  CounterView.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/16.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class CounterView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var imageViews:[UIImageView] = []
    var images:[UIImage] = []
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        for _ in 0 ..< 3 {
            let imageView = UIImageView()//frame: CGRect(x: CGFloat(i) * width + 15, y: 2, width: width, height: height-4))
            imageView.image = UIImage(named: "0")
            addSubview(imageView)
            imageViews.append(imageView)
        }
        
        for i in 0 ..< 10 {
            images.append(UIImage(named: "\(i)")!)
        }
        fadeOut()
    }
    
    fileprivate func fadeOut(){
        let width: CGFloat = frame.width / 5
        let height: CGFloat = frame.height
        for i in 0 ..< 3 {
            imageViews[i].frame = CGRect(x: CGFloat(i) * width + 15, y: 2, width: width, height: height-4)
        }
    }

    fileprivate func fadeIn(){
        let width: CGFloat = frame.width / 2.5
        let height: CGFloat = frame.height * 2
        for i in 0 ..< 3 {
            imageViews[i].frame = CGRect(x: CGFloat(i) * width - 5, y: -15 , width: width, height: height)
        }
    }
    
    func setNum(num: Int){
        imageViews[0].image = images[Int(num / 100)]
        imageViews[1].image = images[Int(num / 10 % 10)]
        imageViews[2].image = images[Int(num % 10)]
        fadeIn()
        UIView.animate(withDuration: 0.8, animations: {
            self.fadeOut()
        }, completion: { finished in
        })
    }


}
