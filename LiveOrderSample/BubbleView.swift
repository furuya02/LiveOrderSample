//
//  BubbleView.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/11.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class BubbleView: UIImageView {

    enum Shake{
        case left
        case right
    }
    
    var rect: CGRect?
    var counter = 0
    var shake:Shake = .left
    var life = 4
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        rect = frame
        alpha = 0
        
        self.center = CGPoint(x: UIScreen.main.bounds.width - 60, y: UIScreen.main.bounds.height - 50)
        
        let imageName = "Bubble00\(Int(arc4random() % 5)).png"
        
        self.image = UIImage(named: imageName)
        self.contentMode = .scaleAspectFill
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(BubbleView.update), userInfo: nil, repeats: true)
        self.fadeIn()
    }

    func update() {
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.center.y = self.center.y - 60
            if self.life == 1 {
                if self.shake == .left {
                    self.center.x = self.center.x + 40
                }
                else {
                    self.center.x = self.center.x - 40
                }
            }
        })
        
        if life < 0 {
            self.fadeOut()
        }
        life -= 1
    }
    
    fileprivate func fadeIn() {
        self.alpha = 0
        if arc4random() % 2 == 0 {
            shake = .right
        }
        self.life = Int(arc4random() % 3)

        UIView.animate(withDuration: 0.8, animations: { () -> Void in
            self.bounds = self.rect!
            self.alpha = 0.6
            self.center.y = self.center.y - 100
            if self.shake == .left {
                self.center.x = self.center.x - 20
            }
            else {
                self.center.x = self.center.x + 20
            }
        })
    }

    fileprivate func fadeOut() {
        UIView.animate(withDuration: 1.2, animations: { () -> Void in
            self.alpha = 0
        })
    }
    
}

