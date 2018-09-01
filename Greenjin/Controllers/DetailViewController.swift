//
//  DetailViewController.swift
//  Greenjin
//
//  Created by Mahesh Lad on 13/08/2018.
//  Copyright © 2018 mahesh lad. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    var mopedObj : Moped!
     let  imageCache = NSCache<AnyObject, AnyObject>()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mopedImage: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    var image : UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addressLabel.text = mopedObj.address
      //  mopedImage.image = UIImage(named: mopedObj.image)
        mopedImage.image = self.image
//         if let url = URL(string: self.mopedObj.imageUrl ) {
//            if let image =    self.imageCache.object(forKey:  url as AnyObject  )  as? UIImage {
//            mopedImage.image = image
//           }
//        }
        nameLabel.text = mopedObj.name
        phoneLabel.text = mopedObj.telephone
      //  print("%8d",mopedObj.latitude)
        print(String(format: "%.8f", mopedObj.latitude))
        self.centerMapToPoint(lat: mopedObj.latitude, lng: mopedObj.longitude)
        // let    carpos =  VehicleOnRoad[i]
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = CLLocationCoordinate2D(latitude: mopedObj.latitude, longitude: mopedObj.longitude)

        self.mapView.addAnnotation(annotation)
    }
    

    @IBAction func closeTap(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func centerMapToPoint(lat: Double, lng: Double) {
       // print(lat)
        //center to map to point
        let  location2d =   CLLocationCoordinate2D(latitude: lat, longitude: lng)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)  //0.8
        let region = MKCoordinateRegion(center: location2d, span: span)
        mapView.setRegion(region, animated: true)
    }
   

}
