//
//  AVPlayerView.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/11.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import AVFoundation
import UIKit

/**
 *  ライブ動画ビュー
 */
class VideoView : UIView{
    
    var playerItem : AVPlayerItem!
    var videoPlayer : AVPlayer!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }

    func play(url:URL){
        playerItem = AVPlayerItem(asset: AVURLAsset(url: url))
        videoPlayer = AVPlayer(playerItem: playerItem)
        let layer = self.layer as! AVPlayerLayer
        layer.videoGravity = AVLayerVideoGravityResizeAspect
        layer.player = videoPlayer
        videoPlayer.play()
    }

    
}
