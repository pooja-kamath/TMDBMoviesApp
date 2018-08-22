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
    ///Outlets
    @IBOutlet weak var searchTable: UITableView!
    @IBOutlet weak var loadingSearchView: UIView!
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    ///Result arrays
    var searchResults:[Movie] = [Movie]()
    
    ///View did load
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Set search bar delegate
        movieSearchBar.delegate = self
    }
        
    ///MARK:Table view delegate and data source methods
    
    //Number of cells in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    //Get Table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchTableViewCell
        cell.Configure(movie: searchResults[indexPath.row])
        return cell
    }
    
    //Table view item selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //Push to detail view
        PushDetailViewController(movieId: searchResults[indexPath.row].id)
    }
    
    //Search bar editing delegate
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
    
    //Push to detail view controller
    func PushDetailViewController(movieId :String)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.id = movieId
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
