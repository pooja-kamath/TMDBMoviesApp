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
 
    var enumGetType :EnumURLType = EnumURLType.Popular
    var DataList :[Movie] = [Movie]()
    var movieID = ""
    var pageNumber = 1
    
    @IBOutlet weak var moreCollectionViewController: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        GetData()
        self.title = String(describing: enumGetType)
    }
    func GetData()
    {
        let dataManager = DataManager()
        dataManager.GetData(urlType: enumGetType, completionHandler: { (data) in
            self.DataList = data
            self.moreCollectionViewController.reloadData()
        })
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customcell = (collectionView.dequeueReusableCell(withReuseIdentifier: "MoreCell", for: indexPath)) as! MoreCollectionCell
        customcell.Configure(movie: DataList[indexPath.row])
        return customcell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.movieID =  DataList[indexPath.row].id
        self.PushDetailViewController()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == DataList.count - 1 {
            updateNextSet()
            pageNumber = pageNumber + 1
        }
    }
    
    func PushDetailViewController()
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.id = self.movieID
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func updateNextSet(){
        let dataManager = DataManager()
        dataManager.GetData(urlType: enumGetType, completionHandler: { (data) in
            self.DataList = self.DataList + data
            self.moreCollectionViewController.reloadData()
        },pageNumber:self.pageNumber)
    }
}
