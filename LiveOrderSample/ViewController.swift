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
    

    // ライブ表示
    @IBOutlet weak var labelLive: UILabel!
    // 視聴者数
    @IBOutlet weak var audienceView: AudienceView!
    
    // ライブ動画
    @IBOutlet weak var videoView: VideoView!

    // 操作部
    let controllViewHeight:CGFloat = 100
    
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
    
    // 落札
    var bidView: BidView!
    let bidViewHeight:CGFloat = 30
    let bidTexts = ["2,000円で入札","14,000円で入札","20,000円で落札"]
    let bidSws = [false,false,true]
    var bidIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // LIVE
        labelLive.layer.cornerRadius = 5
        labelLive.clipsToBounds = true

        // いいね
        likeView = LikeView(frame: CGRect(x: UIScreen.main.bounds.width - likeViewWidth,
                                          y: UIScreen.main.bounds.height - likeViewWidth,
                                      width: likeViewWidth,
                                     height: likeViewWidth))
        videoView.addSubview(likeView)
        
        // メッセージ
        messageView = MessageView(frame:CGRect(x: 0,
                                               y: UIScreen.main.bounds.height - messageViewHeight - controllViewHeight,// 下からの余白
                                           width: UIScreen.main.bounds.width - likeViewWidth + 30, // 「いいね」用の余白
                                          height: messageViewHeight))
        videoView.addSubview(messageView)
        
        // 落札
        bidView = BidView(frame:CGRect(x: 0,
                                       y: UIScreen.main.bounds.height - messageViewHeight - controllViewHeight - bidViewHeight,// 下からの余白
                                   width: UIScreen.main.bounds.width - likeViewWidth + 30, // 「いいね」用の余白
                                  height: bidViewHeight))
        videoView.addSubview(bidView)
        
        // ライブ動画再生
        videoView.play(url: "http://live-order.s3-website-ap-northeast-1.amazonaws.com/index.m3u8")
    }
    var debug = 0
    
    @IBAction func tapMessageButton(_ sender: Any) {
        messageView.appned(name: messageNames[messageIndex], color: messageColors[messageIndex], text: messageTexts[messageIndex])
        messageIndex += 1
        if messageTexts.count <= messageIndex {
            messageIndex = 0
        }
        
        if (arc4random() % 2) == 0 {
            audienceView.appned() // ランダムに視聴者数を追加する
        }
    }
    
    @IBAction func tapBidButton(_ sender: Any) {
        bidView.appned(text: bidTexts[bidIndex], sw: bidSws[bidIndex])
        bidIndex += 1
        if bidTexts.count <= bidIndex {
            bidIndex = 0
        }
    }

    @IBAction func tapAnimeButton(_ sender: Any) {
        likeView.start()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

