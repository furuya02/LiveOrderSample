//
//  LikeView.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/12.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//



import UIKit

/**
 *  「いいね」ビュー
 */
class LikeView: UIView {

    let maxLikeView = 20 // 画面上に表示するLikeViewItemは、２０個ぐらいまで？
    var likeItems:[LikeItemView] = []
    var index = 0
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // このビューは、インタラクションを受け取らない
        isUserInteractionEnabled = false
        alpha = 0
    }
    
    override func layoutSubviews() {
        for _ in 0 ..< maxLikeView {
            let likeItemView = LikeItemView(frame: self.frame)
            likeItems.append(likeItemView)
            self.superview?.addSubview(likeItemView)
        }
    }

    func start() {
        likeItems[index].fadeIn()
        index += 1
        if likeItems.count <= index {
            index = 0
        }

    }
    
}
