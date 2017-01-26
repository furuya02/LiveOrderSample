//
//  CollectionViewCell.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/26.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var videoView: VideoView?
    var titleLabel: UILabel!
    var headerView: UIView!
    var footerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        videoView = VideoView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        addSubview(videoView!)
        
        headerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 50))
        headerView.backgroundColor = UIColor.black
        headerView.alpha = 0.4
        addSubview(headerView)

        
        footerView = UIView(frame: CGRect(x: 0, y: frame.height - 50, width: frame.width, height: 50))
        footerView.backgroundColor = UIColor.black
        footerView.alpha = 0.4
        addSubview(footerView)

        
        titleLabel = UILabel(frame: CGRect(x: 0, y: frame.height - 40, width: frame.width, height: 20))
        titleLabel?.textColor = UIColor.white
        titleLabel.textAlignment = NSTextAlignment.center
        addSubview(titleLabel)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setChannel(channel: Channel){
        videoView?.play(url: channel.url)
        titleLabel?.text = channel.title
    }
    
}
