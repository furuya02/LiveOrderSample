//
//  BubbleView.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/11.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

/**
 *  「いいね」ビューの個々の画像ビュー
 */
class LikeItemView: UIImageView {

    fileprivate enum Shake{
        case left
        case right
    }
    
    fileprivate var superFrame: CGRect!
    fileprivate var shake:Shake = .left
    fileprivate var lifeCounter = -1
    fileprivate var timer: Timer?
    fileprivate let shakeWidth: CGFloat = 30 // 横に揺れる幅
    fileprivate let InitialVelocity:CGFloat = 100 // 初速
    fileprivate let speed:CGFloat = 60
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        superFrame = frame
        image = UIImage(named: "Like00\(Int(arc4random() % 5))")
        contentMode = .scaleAspectFill
    }
    
    func update() {
        guard lifeCounter >= 0 else {
            return
        }

        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.center.y -= self.speed
            if self.lifeCounter == 1 || self.lifeCounter == 3{
                if self.shake == .left {
                    self.center.x += self.self.shakeWidth
                    self.shake = .right
                }
                else {
                    self.center.x -= self.shakeWidth
                    self.shake = .left
                }
            }
        })
        if lifeCounter == 0 {
            self.fadeOut()
        }
        lifeCounter -= 1
    }
    
    func fadeIn() {
        if lifeCounter >= 0 {
            return // 表示中は再利用不能
        }
        // 親ビューの中心から発生する
        center = CGPoint(x: superFrame.origin.x + superFrame.width/2, y: superFrame.origin.y + superFrame.height/2)
        alpha = 0
        bounds = CGRect(x: 0, y: 0, width: 0, height: 0)
        // 寿命
        lifeCounter = Int(arc4random() % 3) + 2
        // 左右の揺れ
        shake = (arc4random() % 2) == 0 ? .left : .right
        // 発生
        UIView.animate(withDuration: 0.8, animations: { () -> Void in
            self.bounds = self.superFrame
            self.alpha = 0.6
            self.center.y -= self.InitialVelocity
            if self.shake == .left {
                self.center.x -= self.shakeWidth / 2
            }
            else {
                self.center.x -= self.shakeWidth / 2
            }
        })
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(LikeItemView.update), userInfo: nil, repeats: true)
    }

    fileprivate func fadeOut() {
        UIView.animate(withDuration: 1.2, animations: { () -> Void in
            self.alpha = 0
        })
        timer?.invalidate()
        timer = nil
        lifeCounter = -1
    }
}

