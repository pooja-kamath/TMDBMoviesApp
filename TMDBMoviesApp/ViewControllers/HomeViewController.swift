//
//  HomeViewController.swift
//  TMDBMoviesApp
//
//  Created by Audiology 5 on 19/08/18.
//  Copyright © 2018 Edureka. All rights reserved.
//

import Foundation
import UIKit


class HomeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDelegate,UITableViewDataSource
{
    
    @IBOutlet weak var downTV: UITableView!
    @IBOutlet weak var TopCollectionView: UICollectionView!
    
    var NowPlayingList :[Movie] = [Movie]()
    var PopularList :[Movie] = [Movie]()
    var TopRatedList :[Movie] = [Movie]()
    var UpComingList :[Movie] = [Movie]()
    var movieID = ""
    override func viewDidLoad()
    {
        super.viewDidLoad()
        TopCollectionView.flashScrollIndicators()
        TopCollectionView?.showsVerticalScrollIndicator = true

        let dataManager = DataManager()
        dataManager.GetData(urlType: EnumURLType.NowPlaying, completionHandler: { (data) in
            self.NowPlayingList = data
            self.TopCollectionView.reloadData()
        })
        dataManager.GetData(urlType: EnumURLType.Popular, completionHandler: { (data) in
            self.PopularList = data
            self.downTV.beginUpdates()
            let index :IndexPath = IndexPath(row: 0, section: 0)
            self.downTV.reloadRows(at: [index], with: UITableViewRowAnimation.fade)
            self.downTV.endUpdates()
        })
        dataManager.GetData(urlType: EnumURLType.TopRated, completionHandler: { (data) in
            self.TopRatedList = data
            self.downTV.beginUpdates()
            let index :IndexPath = IndexPath(row: 1, section: 0)
            self.downTV.reloadRows(at: [index], with: UITableViewRowAnimation.fade)
            self.downTV.endUpdates()
        })
        dataManager.GetData(urlType: EnumURLType.UpComing, completionHandler: { (data) in
            self.UpComingList = data
            self.downTV.beginUpdates()
            let index :IndexPath = IndexPath(row: 2, section: 0)
            self.downTV.reloadRows(at: [index], with: UITableViewRowAnimation.fade)
            self.downTV.endUpdates()
        })
        let layout = TopCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize.init(width: (UIScreen.main.bounds.width), height: TopCollectionView.frame.height)
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
       return NowPlayingList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let customcell = (collectionView.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath)) as! TopCustomCollectionCell
       customcell.Configure(movie: NowPlayingList[indexPath.row])
        return customcell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.movieID =  NowPlayingList[indexPath.row].id
        self.PushDetailViewController()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let customCell  =  (tableView.dequeueReusableCell(withIdentifier: "customCell"))as! CustomTableViewCell

        AddDelegates(customCell: customCell)
        
        if(indexPath.row == 0)
        {
            customCell.Configure(movies: PopularList, cellTag: 0, cellText: "Popular")
        }
        else if(indexPath.row == 1)
        {
            customCell.Configure(movies: TopRatedList, cellTag: 0, cellText: "Top Rated")
        }
        else if(indexPath.row == 2)
        {
            customCell.Configure(movies: UpComingList, cellTag: 0, cellText: "Up-Coming")
        }
        else
        {
            customCell.Configure(movies: PopularList, cellTag: 0, cellText: "Popular")
        }
        return customCell
    }
    
    func GetMovieId(path:IndexPath,index:Int) -> String
    {
        if(path.row == 0)
        {
            return PopularList[index].id
        }
        else if(path.row == 1)
        {
            return TopRatedList[index].id
        }
        else
        {
           return UpComingList[index].id
        }
    }
    
    func AddDelegates(customCell :CustomTableViewCell)
    {
        customCell.tappedMoreButton = {
         [unowned self] (selectedCell) -> Void in
            let path = self.downTV.indexPathForRow(at: selectedCell.center)!
            //push to more list
            if(path.row == 0)
            {
              self.PushMoreViewController(urlType: EnumURLType.Popular)
            }
            else if(path.row == 1)
            {
                self.PushMoreViewController(urlType: EnumURLType.TopRated)
            }
            else
            {
                self.PushMoreViewController(urlType: EnumURLType.UpComing)
            }

        }
        customCell.tappedOne = { [unowned self] (selectedCell) -> Void in
            let path = self.downTV.indexPathForRow(at: selectedCell.center)!
            self.movieID = self.GetMovieId(path: path, index: 0)
            self.PushDetailViewController()
        }
        
        customCell.tappedTwo = { [unowned self] (selectedCell) -> Void in
            let path = self.downTV.indexPathForRow(at: selectedCell.center)!
            self.movieID = self.GetMovieId(path: path, index: 1)
            self.PushDetailViewController()
        }
        
        customCell.tappedThree = { [unowned self] (selectedCell) -> Void in
            let path = self.downTV.indexPathForRow(at: selectedCell.center)!
            self.movieID = self.GetMovieId(path: path, index: 2)
            self.PushDetailViewController()
        }
    }
    
    func PushDetailViewController()
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.id = self.movieID
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func PushMoreViewController(urlType :EnumURLType)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MoreVC") as! MoreViewController
        vc.enumGetType = urlType
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
}
