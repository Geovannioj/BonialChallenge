//
//  NewsCustomLayout.swift
//  NewsApp
//
//  Created by Geovanni Oliveira de Jesus on 05/10/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit

protocol NewsLayoutDelegate: AnyObject {
    func isDeviceOrientationPortrait() -> Bool
}

class NewsCustomLayout: UICollectionViewLayout {

    weak var delegate: NewsLayoutDelegate?
    
    private var numberOfColumns = 2
    private let cellPadding: CGFloat = 6
    private var cache: [UICollectionViewLayoutAttributes] = []
    private var contentHeight: CGFloat = 0
    private let cellHeight: CGFloat = 300.0
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        if (delegate?.isDeviceOrientationPortrait())! {
            self.numberOfColumns = 2
        } else {
            self.numberOfColumns = 3
        }
        
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset: [CGFloat] = []
        for column in 0..<numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
        let sections = collectionView!.numberOfSections - 1
        
        for section in 0...sections {
            for item in 0..<collectionView!.numberOfItems(inSection: section) {
                let indexPath = IndexPath(item: item, section: section)
                let photoHeight = cellHeight
                let height = cellPadding * 2 + photoHeight
                let frame:CGRect?
                frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
                let insetFrame = frame!.insetBy(dx: cellPadding, dy: cellPadding)
                
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = insetFrame
                cache.append(attributes)
                
                contentHeight = max(contentHeight, frame!.maxY)
                yOffset[column] = yOffset[column] + height
                
                column = column < (numberOfColumns - 1) ? (column + 1): 0
            }
        }
    }
    
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, with: indexPath)
        attributes.frame = CGRect(x: 0, y: 0, width: (self.collectionView?.frame.size.width)!, height: 100)
        return attributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttibutes: [UICollectionViewLayoutAttributes] = []
        
        for attibutes in cache {
            if attibutes.frame.intersects(rect) {
                visibleLayoutAttibutes.append(attibutes)
            }
        }
        return visibleLayoutAttibutes
    }
    
    
}
