//
//  ViewController.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/11.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var playerItem : AVPlayerItem!
    var videoPlayer : AVPlayer!
    
    @IBOutlet weak var messageTableView: MessageTableView!
    @IBOutlet weak var videoPlayerView: AVPlayerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //https://sites.google.com/a/gclue.jp/swift-docs/ni-yinki100-ios/3-avfoundation/006-dong-huano-zai-sheng
        // online movie
        let url = NSURL(string: "http://live-order.s3-website-ap-northeast-1.amazonaws.com/index.m3u8")
        let avAsset = AVURLAsset(url: url as! URL)
        // パスからassetを生成.
//        let fileURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: "SapporoOffice", ofType: "mov"))
//        let avAsset = AVURLAsset(url: fileURL as URL, options: nil)

        playerItem = AVPlayerItem(asset: avAsset)
        videoPlayer = AVPlayer(playerItem: playerItem)
        let layer = videoPlayerView.layer as! AVPlayerLayer
        layer.videoGravity = AVLayerVideoGravityResizeAspect
        layer.player = videoPlayer
        self.view.layer.addSublayer(layer)
    }
    
    @IBAction func tapStartButton(_ sender: Any) {
        videoPlayer.play()
    }
    
    @IBAction func tapAnimeButton(_ sender: Any) {
        
        //let image = UIImage(named: "0-09.png")
        let imageView = BubbleView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                videoPlayerView.addSubview(imageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

