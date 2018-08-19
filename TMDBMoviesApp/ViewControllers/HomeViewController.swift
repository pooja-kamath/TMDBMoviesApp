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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
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
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        let numberOfCell: CGFloat = 3   //you need to give a type as CGFloat
        let cellWidth = UIScreen.main.bounds.size.width / numberOfCell
        return CGSize(width:cellWidth, height:cellWidth)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell  =  (tableView.dequeueReusableCell(withIdentifier: "customCell"))as! CustomTableViewCell
        
        if(indexPath.row == 0)
        {
            customCell.Configure(movies: PopularList)
        }
        else if(indexPath.row == 1)
        {
            customCell.Configure(movies: TopRatedList)
        }
        else if(indexPath.row == 2)
        {
            customCell.Configure(movies: UpComingList)
        }
        else
        {
            customCell.Configure(movies: PopularList)
        }
        return customCell
    }
}
