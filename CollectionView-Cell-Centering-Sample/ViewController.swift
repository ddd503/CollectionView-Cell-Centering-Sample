//
//  ViewController.swift
//  CollectionView-Cell-Centering-Sample
//
//  Created by kawaharadai on 2018/11/17.
//  Copyright © 2018 kawaharadai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        }
    }
    let imageNameArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
        collectionView.reloadData()
    }

    func prepare() {
        collectionView.isPagingEnabled = false
        collectionView.decelerationRate = .fast
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            fatalError("cell is nil")
        }
        cell.imageView.image = UIImage(named: imageNameArray[indexPath.row])!
        return cell
    }
}
