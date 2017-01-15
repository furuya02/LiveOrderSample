//
//  AudienceView.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/12.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit

class AudienceView: UILabel {
    
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        layer.cornerRadius = 5
        clipsToBounds = true
        
        //count = 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    var count:Int = 0 {
        didSet {
            let attrString = NSMutableAttributedString(string: "")
            let attachment = NSTextAttachment()
            attachment.image = UIImage(named: "Audience.png")
            attachment.bounds = CGRect(x: 0, y: 0, width: 19, height: 13)
            attrString.append(NSAttributedString(attachment: attachment))
            attrString.append(NSAttributedString(string: "\(count)"))
            attributedText = attrString
        }
    }

}
