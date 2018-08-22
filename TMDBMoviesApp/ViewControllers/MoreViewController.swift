//
//  MoreViewController.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 20/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import Foundation
import  UIKit
class MoreViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource
{
    //URL type to fetch
    var enumGetType :EnumURLType = EnumURLType.Popular
    
    ///Result arrays
    var DataList :[Movie] = [Movie]()
    
    ///Movie id
    var movieID = ""
    
    //Page to fetch
    var pageNumber = 1
    
    ///Outlets
    @IBOutlet weak var moreCollectionViewController: UICollectionView!
    
    ///View did load
    override func viewDidLoad()
    {
        super.viewDidLoad()
        GetData()
        self.title = String(describing: enumGetType)
    }
    
    //Load data from data manager
    func GetData()
    {
        //Initialize data manager
        let dataManager = DataManager()
        
        //Get the list
        dataManager.GetData(urlType: enumGetType, completionHandler: { (data) in
            self.DataList = data
            self.moreCollectionViewController.reloadData()
        })
    }
    
    ///MARK:Collection view delegate and data source methods
    
    ///Number of items in section of collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataList.count
    }
    
    ///Get collection view cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customcell = (collectionView.dequeueReusableCell(withReuseIdentifier: "MoreCell", for: indexPath)) as! MoreCollectionCell
        customcell.Configure(movie: DataList[indexPath.row])
        return customcell
    }
    
    ///Did select collection view cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.movieID =  DataList[indexPath.row].id
        self.PushDetailViewController()
    }
    
    //Will display cell
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == DataList.count - 1 {
            updateNextSet()
            pageNumber = pageNumber + 1
        }
    }
    
    //Push to detail view controller
    func PushDetailViewController()
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.id = self.movieID
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //Pagination of the next set of data
    func updateNextSet()
    {
        let dataManager = DataManager()
        dataManager.GetData(urlType: enumGetType, completionHandler: { (data) in
            self.DataList = self.DataList + data
            self.moreCollectionViewController.reloadData()
        },pageNumber:self.pageNumber)
    }
}
