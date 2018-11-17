//
//  CustomFlowLayout.swift
//  CollectionView-Cell-Centering-Sample
//
//  Created by kawaharadai on 2018/11/17.
//  Copyright © 2018 kawaharadai. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    let itemWidth: CGFloat =  UIScreen.main.bounds.width * 0.8 // セルの横幅
    let itemHeight: CGFloat = UIScreen.main.bounds.height * 0.8 // セルの縦幅
    let interitemSpacing: CGFloat = 20  // セル同士のinset
    let flickVelocityThreshold: CGFloat = 0.2 // フリックの圧
   
    
    override func awakeFromNib() {
        super .awakeFromNib()
        prepareComponent()
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return proposedContentOffset }
        let currentPage: CGFloat = collectionView.contentOffset.x / pageWidth()
        if (abs(velocity.x) > flickVelocityThreshold) {
            let nextPage: CGFloat = (velocity.x > 0.0) ? ceil(currentPage) : floor(currentPage)
            return CGPoint(x: (nextPage * pageWidth()), y: proposedContentOffset.y)
        } else {
            return CGPoint(x: (round(currentPage) * pageWidth()), y: proposedContentOffset.y)
        }
    }
    
    func pageWidth() -> CGFloat {
        return self.itemSize.width + self.minimumLineSpacing
    }
    
    func prepareComponent() {
        self.itemSize = CGSize(width: itemWidth, height: itemHeight)
        self.minimumLineSpacing = interitemSpacing
        self.scrollDirection = .horizontal
        
        let horizontalInset: CGFloat = (UIScreen.main.bounds.size.width - itemWidth) / 2
        let verticalInset: CGFloat = (UIScreen.main.bounds.size.height - itemHeight) / 2
        
        self.sectionInset = UIEdgeInsets(top: verticalInset,
                                         left: horizontalInset,
                                         bottom: verticalInset,
                                         right: horizontalInset)
    }
    
}
