//
//  NewsPageViewController.swift
//  NewsApp
//
//  Created by Geovanni Oliveira de Jesus on 29/09/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit
import Kingfisher

class NewsPageViewController: UIViewController {

    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var urlLbl: UILabel!
    @IBOutlet weak var contentTxtView: UITextView!
    
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDataUp()
    }
    
    func setDataUp() {
        self.titleLbl.text = self.article?.getTitle()
        self.authorLbl.text = self.article?.getAuthor()
        self.sourceLbl.text = self.article?.getSource().getSourceName()
        self.urlLbl.text = self.article?.getURL()
        self.contentTxtView.text = self.article?.getContent()
        
        if let url = URL(string: article!.getURLImage()) {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = nil
        }
    }

}
