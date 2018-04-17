//
//  ListLayout.swift
//  GitRepos
//
//  Created by Mariam Issa on 4/17/18.
//  Copyright © 2018 Mariam Al Ethawy. All rights reserved.
//

import UIKit

class ListLayout: UICollectionViewFlowLayout {
    let itemHeight: CGFloat = 120
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 0
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }
    
    func itemWidth() -> CGFloat {
        return  collectionView?.frame.size.width ?? 0
    }
    
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width: itemWidth(), height: itemHeight)
        }
        get {
            return CGSize(width: itemWidth(), height: itemHeight)
        }
    }
    
    override func targetContentOffset(forProposedContentOffset ForProposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
}
