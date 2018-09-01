//
//  HomeViewController.swift
//  Greenjin
//
//  Created by Mahesh Lad on 13/08/2018.
//  Copyright © 2018 mahesh lad. All rights reserved.
//

import UIKit
import DKScrollingTabController

import FBSDKCoreKit
import FBSDKLoginKit
import RealmSwift

//private let imageCache = NSCache<AnyObject, AnyObject>()

class HomeViewController: UIViewController, DKScrollingTabControllerDelegate,  UICollectionViewDelegate, UICollectionViewDataSource{
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    let tabController = DKScrollingTabController()
    private let reuseIdentifier = "Cell"
    
    var mopeds : Results<Moped>!
    var filterkey = "50cc scooter"
   
     let  imageCache = NSCache<AnyObject, AnyObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.addChildViewController(tabController)
      //  self.addChild(tabController)
        tabController.didMove(toParentViewController: self)
        self.view.addSubview(tabController.view)
        // tabController.view.frame = CGRect(x:0, y:20, width:self.view.bounds.width, height:40)
        tabController.view.frame = CGRect(x:0, y:20, width: 300, height:40)
        
        tabController.buttonPadding = 25
        tabController.selection = ["50cc moped", "125cc moped"]
        tabController.delegate = self
        
        // Register cell classes
        self.collectionView!.register(UINib(nibName: "MopedViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        filterkey = "manufacture = '50cc scooter'"
        mopeds = DataManager.sharedInstance.getDataFromDBFiltered(filterkey: filterkey)
        
    }
    
    
    // MARK: - ScrollingTab
    func scrollingTabController(_ controller: DKScrollingTabController!, selection: UInt) {
        print("tapped \(selection) \n")
        
        
        switch selection {
        case 0:
            //  DispatchQueue.global(qos: .userInitiated).async {
            self.filterkey = "manufacture = '50cc scooter'"
            self.mopeds = DataManager.sharedInstance.getDataFromDBFiltered(filterkey: self.filterkey)
            
            self.collectionView.reloadSections(IndexSet(integer: 0))
            
          //  DispatchQueue.main.async(execute: collectionView.reloadData)
            
        case 1:
            //   DispatchQueue.global(qos: .userInitiated).async {
            self.filterkey = "manufacture = '125cc scooter'"
            self.mopeds = DataManager.sharedInstance.getDataFromDBFiltered(filterkey: self.filterkey)
            self.collectionView.reloadSections(IndexSet(integer: 0)) //need this to refresh
            
           // DispatchQueue.main.async(execute: collectionView.reloadData)
            
        default:
            filterkey = "manufacture = '50cc scooter'"
            self.mopeds = DataManager.sharedInstance.getDataFromDBFiltered(filterkey: filterkey)
            self.collectionView.reloadSections(IndexSet(integer: 0)) //need this to refresh
            DispatchQueue.main.async(execute: collectionView.reloadData)
        }
        
    }
    
    
    @IBAction func logoutTap(_ sender: Any) {
        
        FBSDKAccessToken.setCurrent(nil)
        FBSDKProfile.setCurrent(nil)
        FBSDKLoginManager().logOut()
        self.dismiss(animated: true, completion: nil)
    }
    
 
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print(mopeds.count)
        return  mopeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as!  MopedViewCell
        
//        DispatchQueue.main.async {
//            cell.mopedImage.image = UIImage(named: self.mopeds[indexPath.row].image)
//
//            print(self.mopeds[indexPath.row].image)
//        }
 
        cell.mopedImage?.image = UIImage()
        if let url = URL(string: self.mopeds[indexPath.row].imageUrl ) {
            
            if let image =    self.imageCache.object(forKey:  url as AnyObject  )  as? UIImage {
                cell.mopedImage?.image = image
            }  else {
                
                
                DispatchQueue.global().async {
                    guard  let data = try? Data(contentsOf: url) else {return}
                    let image =   UIImage(data: data)
                    self.imageCache.setObject(image!, forKey: url as AnyObject )
                    
                    DispatchQueue.main.async {
                        cell.mopedImage?.image = image
                    }
                    
                }
            }
        } else {
            cell.mopedImage?.image  = UIImage()
        }
        
 
        cell.tag = indexPath.row
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //select image
        self.activityIndicator.startAnimating()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        detailsVC.mopedObj = self.mopeds[indexPath.row]
        if let url = URL(string: self.mopeds[indexPath.row].imageUrl ) {
             if let image =    self.imageCache.object(forKey:  url as AnyObject  )  as? UIImage {
                 detailsVC.image = image
            }
            
        }
       
       
        self.present(detailsVC, animated: false, completion: nil)
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.activityIndicator.stopAnimating()
    }
    
}


