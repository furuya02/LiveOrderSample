//
//  CollectionViewFlowLayout.swift
//  LiveOrderSample
//
//  Created by hirauchi.shinichi on 2017/01/26.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit


class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    let kFlickVelocityThreshold: CGFloat = 0.2
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepre()
    }
    
    // MARK: UICollectionViewLayout
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let currentPage: CGFloat = collectionView!.contentOffset.x / self.pageWidth;
        
        if fabs(velocity.x) > kFlickVelocityThreshold {
            let nextPage: CGFloat = (velocity.x > 0.0) ? ceil(currentPage) : floor(currentPage);
            return CGPoint(x: nextPage * self.pageWidth - 65, y: proposedContentOffset.y)  //-100の時 -40  -150の時 -65
        } else {
            return CGPoint(x: round(currentPage) * self.pageWidth - 65, y: proposedContentOffset.y)
        }
    }
    
    // MARK: Private
    var pageWidth: CGFloat {
        return self.itemSize.width + self.minimumLineSpacing
    }
    
    func prepre() {
        let width = UIScreen.main.bounds.width - 150
        let height = UIScreen.main.bounds.height - 250
        let space: CGFloat = 20
        self.itemSize = CGSize(width: width, height: height)
        self.minimumLineSpacing = space //kMinimumInteritemSpacing
        self.scrollDirection = UICollectionViewScrollDirection.horizontal
        let horizontalInset: CGFloat = 10
        let verticalInset: CGFloat = 10
        self.sectionInset = UIEdgeInsetsMake(verticalInset,
                                             horizontalInset,
                                             verticalInset,
                                             horizontalInset)
    }
}

