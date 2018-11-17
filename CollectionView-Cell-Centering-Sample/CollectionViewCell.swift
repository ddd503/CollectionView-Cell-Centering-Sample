//
//  CollectionViewCell.swift
//  CollectionView-Cell-Centering-Sample
//
//  Created by kawaharadai on 2018/11/17.
//  Copyright © 2018 kawaharadai. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
