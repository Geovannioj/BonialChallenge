//
//  ArticleCollectionViewCell.swift
//  NewsApp
//
//  Created by Geovanni Oliveira de Jesus on 29/09/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleCollectionViewCell: UICollectionViewCell {
    
    //MARK: cell outlets 
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var timePassedLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /**
     Method to get an instance of article and extract its's information to fulfill
     a collectionView Cell with them
     - parameter article: article instance to get it's atibute info
     */
    func fulfillCell(article: Article) {
        titleLbl.text = article.getTitle()
        descriptionLbl.text = article.getDescription()
        sourceLbl.text = "From: \(article.getSource().getSourceName())"
        
        if let url = URL(string: article.getURLImage()) {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = nil
        }
        
    }
}
