//
//  SearchViewController.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 22/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate
{
    @IBOutlet weak var searchTable: UITableView!
    @IBOutlet weak var loadingSearchView: UIView!
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var searchResults:[Movie] = [Movie]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        movieSearchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchTableViewCell
        cell.Configure(movie: searchResults[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        PushDetailViewController(movieId: searchResults[indexPath.row].id)
    }
    
    func searchBar(_ searchBar: UISearchBar,
                            textDidChange searchText: String)
    {
        let dataManager = DataManager()
        dataManager.GetData(urlType: EnumURLType.Search, completionHandler: { (data) in
            self.searchResults = data
            self.loadingSearchView.isHidden = true
            self.searchTable.reloadData()
            
        },pageNumber: 1,movieId:"",query: searchBar.text!)
    }
    
    func PushDetailViewController(movieId :String)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.id = movieId
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
