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
    

    // 「いいね」
    var likeView: LikeView!
    let likeViewWidth:CGFloat = 80
    
    // 「ライブ動画」
    @IBOutlet weak var videoView: VideoView!

    override func viewDidLoad() {
        super.viewDidLoad()

        likeView = LikeView(frame: CGRect(x: UIScreen.main.bounds.width - likeViewWidth,
                                          y: UIScreen.main.bounds.height - likeViewWidth,
                                      width: likeViewWidth,
                                     height: likeViewWidth))
        videoView.addSubview(likeView)
        videoView.play(url: "http://live-order.s3-website-ap-northeast-1.amazonaws.com/index.m3u8")
    }
    
    @IBAction func tapStartButton(_ sender: Any) {
    }
    
    @IBAction func tapAnimeButton(_ sender: Any) {
        likeView.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

