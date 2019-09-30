//
//  ViewController.swift
//  NewsApp
//
//  Created by Geovanni Oliveira de Jesus on 28/09/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit
import Alamofire

class TopHeadlinesViewController: UICollectionViewController {

    private var artitles: [Article] = []
    var articleToExpand: Article?
    private var presenter: TopHeadLinesPresenter?
    private let itensShown = 6
    private let cellIdentifier = "cell"
    private let itensInRow = 2
    
    
    private var status: String = ""
    private var loadingNews: Bool = false
    private var network: AlamofireManager?
    private let URLTOPHEADS = "https://newsapi.org/v2/top-headlines"
    private let NEWS_AMOUNT = 21
    private let TOTAL_ARTICLES = 0
    private var articlesAmount = 6
    private var currentPage = 0
    private var totalAmount = 0
    private let segueID = "expandArticle"


    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
        network = AlamofireManager()
        getArticles()
       
    }

    func getArticles() {
        self.loadingNews = true
        network?.requestData(url: self.URLTOPHEADS, country: "us", amount: self.NEWS_AMOUNT, completion: { (information) in
            if let information = information {
                self.artitles += information
    
                for article in self.artitles {
                    print(article.returnCompleteArticle())
                }
                
                DispatchQueue.main.async {
                    self.loadingNews = false
                    self.collectionView.reloadData()
                    print("Reloading collectionView")
                }
                
            }
            
            
        })
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.artitles.count
    }
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as? ArticleCollectionViewCell
        let article = artitles[indexPath.row]
        cell?.fulfillCell(article: article)
        
        return cell!
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueID {
            if let newsPageController = segue.destination as? NewsPageViewController {
                newsPageController.article = self.articleToExpand
            }
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.articleToExpand = self.artitles[indexPath.row]
        performSegue(withIdentifier: self.segueID, sender: nil)
    }
    
    private func registerCustomCell() {
        let articleCell = UINib(nibName: "ArticleCell", bundle: nil)
        self.collectionView.register(articleCell, forCellWithReuseIdentifier: self.cellIdentifier)
    }
}

