//
//  CollectionViewController.swift
//  NewsApp
//
//  Created by Geovanni Oliveira de Jesus on 29/09/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class CollectionViewController: UICollectionViewController {
   
    private var artitles: [Article] = []
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
    
    
    private let sectionInsets = UIEdgeInsets(top: 50.0,
                                             left: 20.0,
                                             bottom: 50.0,
                                             right: 20.0)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//        registerCustomCell()
        network = AlamofireManager()
        getArticles()
        self.status = "Buscando notícias, aguarde..."
        print("Iniciou aplicação")
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
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArticleCollectionViewCell
        let article = artitles[indexPath.row]
        cell.titleLbl.text = "Title"
        cell.sourceLbl.text = "Source"
        

        return cell

    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
