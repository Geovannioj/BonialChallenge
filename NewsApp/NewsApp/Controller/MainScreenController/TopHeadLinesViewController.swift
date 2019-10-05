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


    //MARK: - Properties
    
    //Constants
    private let itensShown = 6
    private let cellIdentifier = "cell"
    private let itensInRow = 2
    private let segueID = "expandArticle"
    private let URLTOPHEADS = "https://newsapi.org/v2/top-headlines"
    private let NEWS_AMOUNT = 21
    private let TOTAL_ARTICLES = 0

    //Variables
    private var artitles: [Article] = []
    private var loadingNews: Bool = false
    private var network: AlamofireManager?
    private var articlesAmount = 6
    private var currentPage = 0
    var articleToExpand: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? NewsCustomLayout {
            layout.delegate = self
        }
        registerCustomCell()
        network = AlamofireManager()
        getArticles()
       
    }

    /**
     Method to get the articles from the News API using  Alamofire and stores it to the article array

     */
    func getArticles() {
        self.loadingNews = true
        network?.requestData(url: self.URLTOPHEADS, country: "us", amount: self.NEWS_AMOUNT, page: currentPage,completion: { (information) in
            if let information = information {
                self.artitles += information
                
                DispatchQueue.main.async {
                    self.loadingNews = false
                    self.collectionView.reloadData()
                }
            }
        })
    }
}

//MARK: - Extension to the CollectionView's methods
extension TopHeadlinesViewController{
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return self.artitles.count / 7
//    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return self.artitles.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier,
                                                      for: indexPath) as? ArticleCollectionViewCell
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
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        self.articleToExpand = self.artitles[indexPath.row]
        performSegue(withIdentifier: self.segueID, sender: nil)
    }
    
    /**
     Method that registers the custom cell to be used in the CollectionView
     */
    private func registerCustomCell() {
        let articleCell = UINib(nibName: "ArticleCell", bundle: nil)
        self.collectionView.register(articleCell, forCellWithReuseIdentifier: self.cellIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == artitles.count - 8 && !loadingNews {
            currentPage += 1
            getArticles()
            print("Carregando mais notícias")
        }
    }
}
extension TopHeadlinesViewController: NewsLayoutDelegate {
    func isDeviceOrientationPortrait() -> Bool {
        let devOrientation = UIDevice.current.orientation.isPortrait
        return devOrientation
    }
    
    
}
