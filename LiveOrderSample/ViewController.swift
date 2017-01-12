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
    

    
    
    // ライブ動画
    @IBOutlet weak var videoView: VideoView!

    
    // メッセージ
    var messageView: MessageView!
    let messageViewHeight:CGFloat = 130
    
    let messageTexts = ["こんにちは、これは良いですね！","良いですね","^^)/","ヽ(｀▽´)/　ぜひ欲しいデす","これは欲しいです","んっ","安いと思います！！！"]
    let messageNames = ["佐久間町のゴルゴ１４","Hapy","山田太郎","ClassMethod","大きな声では言えません","^^)","XXX"]
    let messageColors = [UIColor.red,UIColor.blue,UIColor.red,UIColor.yellow,UIColor.orange,UIColor.red,UIColor.green]
    var messageIndex = 0

    // 「いいね」
    var likeView: LikeView!
    let likeViewWidth:CGFloat = 80

    
    override func viewDidLoad() {
        super.viewDidLoad()

        likeView = LikeView(frame: CGRect(x: UIScreen.main.bounds.width - likeViewWidth,
                                          y: UIScreen.main.bounds.height - likeViewWidth,
                                      width: likeViewWidth,
                                     height: likeViewWidth))
        videoView.addSubview(likeView)
        
        
        messageView = MessageView(frame:CGRect(x: 0,
                                               y: UIScreen.main.bounds.height - messageViewHeight - 100,// 下からの余白
                                               width: UIScreen.main.bounds.width - 50, // 「いいね」用の余白
                                               height: messageViewHeight))
        videoView.addSubview(messageView)
        
        videoView.play(url: "http://live-order.s3-website-ap-northeast-1.amazonaws.com/index.m3u8")
    }
    var debug = 0
    
    @IBAction func tapMessageButton(_ sender: Any) {
        messageView.appned(name: messageNames[messageIndex], color: messageColors[messageIndex], text: messageTexts[messageIndex])
        messageIndex += 1
        if messageTexts.count <= messageIndex {
            messageIndex = 0
        }
        
    }
    
    @IBAction func tapAnimeButton(_ sender: Any) {
        likeView.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

