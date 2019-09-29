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

    private var artitles: [Article]? = []
    private var presenter: TopHeadLinesPresenter?
    private let itensShown = 6
    private let cellIdentifier = "cell"
    private let itensInRow = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
        self.presenter = TopHeadLinesPresenter()
        self.artitles = presenter?.getArticles()
        
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.itensShown
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itensInRow
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as? ArticleCollectionViewCell
        return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected cell \(indexPath.item)")
    }
    
    private func registerCustomCell() {
        let articleCell = UINib(nibName: "ArticleCell", bundle: nil)
        self.collectionView.register(articleCell, forCellWithReuseIdentifier: self.cellIdentifier)
    }
}

