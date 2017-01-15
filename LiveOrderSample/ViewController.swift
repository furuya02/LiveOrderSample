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
    
    // オーダー画面
    @IBOutlet weak var orderView: OrderView!
    
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

    // 「いいね」
    var likeView: LikeView!
    let likeViewWidth:CGFloat = 80
    
    // 購入
    var bidView: BidView!
    let bidViewHeight:CGFloat = 30
    
    // プロダクト
    var productView: ProductView!
    let productViewHeight:CGFloat = 70
    
    // プレゼン用データ
    let audienceData = AudienceData()
    let likeData = LikeData()
    let messageData = MessageData()
    let bidData = BidData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        // プロダクト
        productView = ProductView(frame:CGRect(x: 0,
                                               y: 50,
                                           width: UIScreen.main.bounds.width,
                                          height: productViewHeight))
        videoView.addSubview(productView)
        
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
        // videoView.play(url: URL(string: "http://live-order.s3-website-ap-northeast-1.amazonaws.com/index.m3u8")!)
        // ダウンロードするとAWS利用料がかかるのでローカルのファイルを再生する
        videoView.play(url: Bundle.main.url(forResource: "source-512k", withExtension: "mp4")!)
        
        // プレゼン
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateLow), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(ViewController.updateHigh), userInfo: nil, repeats: true)
        
    }
    
    // プレゼン
    func updateLow() {
        audienceView.count = audienceData.get()

        if (arc4random() % 3) == 0 {
            let (text,sw) = bidData.get()
            bidView.appned(text: text, sw:sw)
        }
    }

    // プレゼン
    func updateHigh() {
        if likeData.get() {
            self.likeView.start()
        }
        
        if (arc4random() % 3) == 0 {
            let (text,name,color) = messageData.get()
            self.messageView.appned(name: name, color: color, text: text)
        }
    }
    
    @IBAction func tapMessageButton(_ sender: Any) {
        let (text,name,color) = messageData.get()
        self.messageView.appned(name: name, color: color, text: text)
    }

    @IBAction func tapOrderButton(_ sender: Any) {
        orderView.fadeIn()
    }
    
    @IBAction func tapOrderCloseButton(_ sender: Any) {
        orderView.fadeOut()
    }

    @IBAction func tapAnimeButton(_ sender: Any) {
        likeView.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

