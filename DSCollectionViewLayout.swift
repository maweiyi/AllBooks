//
//  DSCollectionViewLayout.swift
//  AllBooks
//
//  Created by 麻炜怡 on 3/31/16.
//  Copyright © 2016 Weiyi Ma. All rights reserved.
//

import UIKit

class DSCollectionViewLayout: UICollectionViewLayout {
    
    let itemWR1: CGFloat = 140.0
    let itemHR1: CGFloat = 140.0
    
    let itemWR2: CGFloat = 80
    let itemHR2: CGFloat = 80
    
    let itemWR3: CGFloat = 60
    let itemHR3: CGFloat = 60
    
    let itemWR4: CGFloat = 40
    let itemHR4: CGFloat = 40
    
    var showItemNumbers: Int = 0
    
    
    override init() {
        super.init()
}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareLayout() {
        super.prepareLayout()
        self.showItemNumbers = (self.collectionView?.numberOfItemsInSection(0))!
        
    }
    
    /*override func collectionViewContentSize() -> CGSize {
        return CGSizeMake((self.collectionView?.frame.width)!, (self.collectionView?.frame.height)!)
    }*/
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes: [UICollectionViewLayoutAttributes] = []
        
        for item in 0..<self.showItemNumbers {
            
            let attri = self.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: item, inSection: 0))
            attributes.append(attri!)
            
        }
        
        return attributes
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attribute = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        if indexPath.item < self.showItemNumbers {
            switch indexPath.item {
            case 0, 1, 2, 3, 4, 5:
                attribute.center = CGPointMake((self.collectionView?.frame.width)! / 2, (self.collectionView?.frame.height)!)
                
                attribute.size = CGSizeMake(self.itemWR1, self.itemHR1)
                
            /*case 1:
                attribute.center = CGPointMake((self.collectionView?.frame.width)! / 2, (self.collectionView?.frame.height)!)
                attribute.size = CGSizeMake(self.itemWR2, self.itemHR2)
            case 2:
                attribute.center = CGPointMake((self.collectionView?.frame.width)! / 2, (self.collectionView?.frame.height)!)
                attribute.size = CGSizeMake(self.itemWR2, self.itemHR2)
            case 3:
                attribute.center = CGPointMake((self.collectionView?.frame.width)! / 2, (self.collectionView?.frame.height)!)
                attribute.size = CGSizeMake(self.itemWR2, self.itemHR2)
            case 4:
                attribute.center = CGPointMake((self.collectionView?.frame.width)! / 2, (self.collectionView?.frame.height)!)
                attribute.size = CGSizeMake(self.itemWR2, self.itemHR2)*/
            default: break
                
            }
            /*attribute.center = CGPointMake((self.collectionView?.frame.width)! / 2, (self.collectionView?.frame.height)! / 2)
            
            attribute.size = CGSizeMake(self.itemWR1, self.itemHR1)*/

        }
        
        return attribute
    }
    
    
    

}
