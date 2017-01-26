//
//  LiveViewController.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/26.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class LiveViewController: UIViewController {
    
    var channel: Channel?

    // オーダー
    @IBOutlet weak var orderView: OrderView!
    
    // LIVE
    @IBOutlet weak var liveView: UILabel!
    // 視聴者数
    @IBOutlet weak var audienceView: AudienceView!
    
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
    let productData = ProductData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let videoView = VideoView(frame: view.frame)
        view.addSubview(videoView)
        view.sendSubview(toBack: videoView) // 後ろに配置する
        
        videoView.play(url: (channel?.url)!)
        
        
        // LIVE
        liveView.layer.cornerRadius = 5
        liveView.clipsToBounds = true
        
        // いいね
        likeView = LikeView(frame: CGRect(x: UIScreen.main.bounds.width - likeViewWidth,
                                          y: UIScreen.main.bounds.height - likeViewWidth,
                                          width: likeViewWidth,
                                          height: likeViewWidth))
        videoView.addSubview(likeView)
        
        // 落札
        bidView = BidView(frame:CGRect(x: 0,
                                       y: UIScreen.main.bounds.height - messageViewHeight - controllViewHeight - bidViewHeight,// 下からの余白
            width: UIScreen.main.bounds.width - likeViewWidth + 30, // 「いいね」用の余白
            height: bidViewHeight))
        videoView.addSubview(bidView)

        
        // プロダクト
        productView = ProductView(frame:CGRect(x: 0,
                                               y: 50,
                                               width: UIScreen.main.bounds.width,
                                               height: productViewHeight))
        videoView.addSubview(productView)
        
        // メッセージ
        messageView = MessageView(frame:CGRect(x: 0,
                                               y: UIScreen.main.bounds.height - messageViewHeight - controllViewHeight,// 下からの余白
            width: UIScreen.main.bounds.width - likeViewWidth + 30, // 「いいね」用の余白
            height: messageViewHeight))
        videoView.addSubview(messageView)
        
        
        // プレゼン
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(LiveViewController.updateLow), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(LiveViewController.updateHigh), userInfo: nil, repeats: true)


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
            likeView.start()
        }
        
        let n = productData.get()
        productView.incrementCounter(index: n)
        
        if (arc4random() % 3) == 0 {
            let (text,name,color) = messageData.get()
            messageView.appned(name: name, color: color, text: text)
        }
    }

    @IBAction func tapOrderButton(_ sender: Any) {
        orderView.fadeIn()
    }
    
    @IBAction func tapOrderCloseButton(_ sender: Any) {
        orderView.fadeOut()
    }
    @IBAction func tapLikeButton(_ sender: Any) {
        productView.incrementCounter(index: 0)
        likeView.start()
    }
    @IBAction func tapMessageButton(_ sender: Any) {
        let (text,name,color) = messageData.get()
        self.messageView.appned(name: name, color: color, text: text)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func tapCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
