//
//  TableViewController.swift
//  NewsApp
//
//  Created by Geovanni Oliveira de Jesus on 29/09/19.
//  Copyright © 2019 Geovanni Oliveira de Jesus. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

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
                    self.tableView.reloadData()
                    print("Reloading collectionView")
                }
                
            }
            
            
        })
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.artitles.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        cell.textLabel?.text = self.artitles[indexPath.row].getTitle()

        return cell
    }

//    private func registerCustomCell() {
//        let articleCell = UINib(nibName: "ArticleCell", bundle: nil)
//        self.tableView.register(articleCell, forCellWithReuseIdentifier: self.cellIdentifier)
//    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
