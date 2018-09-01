//
//  DataManager.swift
//  Greenjin
//
//  Created by Mahesh Lad on 13/08/2018.
//  Copyright © 2018 mahesh lad. All rights reserved.
//

import UIKit
import RealmSwift


class Moped: Object {
    @objc dynamic var name = ""
    @objc dynamic var image = ""
    @objc dynamic var imageUrl = ""
    @objc dynamic var latitude  = 0.00000000000
    @objc dynamic var longitude = 0.00000000000
    @objc dynamic var address  = ""
    @objc dynamic var telephone  = ""
    @objc dynamic var manufacture  = ""
}

 class DataManager {

    private var   database:Realm
    static let   sharedInstance = DataManager ()
    private init() {
        database = try! Realm()
    }
    
    func getDataFromDB() ->   Results<Moped> {
        let results: Results<Moped> =   database.objects(Moped.self)
        return results
    }
    func addData(object: Moped)   {
        try! database.write {
           // database.add(object, update: true)
            database.add(object)
            print("Added new object")
        }
    }
    func deleteAllFromDatabase()  {
        try!   database.write {
            database.deleteAll()
        }
    }
    func deleteFromDb(object: Moped)   {
        try!   database.write {
            database.delete(object)
        }
    }
    
    func getDataFromDBFiltered(filterkey: String) ->   Results<Moped> {
        let results: Results<Moped> =   database.objects(Moped.self).filter(filterkey)
        return results
    }
    
    
    fileprivate func writeRecord(_ realm: Realm, _ moped1: Moped) {
        // Persist your data easily
        try! realm.write {
            realm.add(moped1)
        }
    }
    
    func populateDatabase()
    {
        
        // Get the default Realm
      //  let realm = try! Realm()
        
        // Use them like regular Swift objects
        let moped1 = Moped()
        moped1.name = "50cc_milan_scooter"
        moped1.image = "50cc_milan_scooter.png"
        moped1.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike6.png"
        moped1.latitude = 51.597149
        moped1.longitude  = -0.336057
        moped1.address = "bike shop, 1 high st"
        moped1.telephone =  "+44 208 1234"
        moped1.manufacture = "50cc scooter"
        addData(object: moped1)
       
        
        let moped2 = Moped()
        moped2.name = "50cc_retro_scooter"
        moped2.image = "50cc_retro_scooter.png"
         moped2.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike3.png"
        moped2.latitude = 51.597149
        moped2.longitude  = -0.336057
        moped2.address = "bike shop, 1 high st"
        moped2.telephone =  "+44 208 1234"
        moped2.manufacture = "50cc scooter"
          addData(object: moped2)
        
        let moped3 = Moped()
        moped3.name = "50cc_scorpion_scooter"
        moped3.image = "50cc_scorpion_scooter.png"
         moped3.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike7.png"
        moped3.latitude = 51.597149
        moped3.longitude  = -0.336057
        moped3.address = "bike shop, 1 high st"
        moped3.telephone =  "+44 208 1234"
        moped3.manufacture = "50cc scooter"
         addData(object: moped3)
        
        let moped4 = Moped()
        moped4.name = "50cc_sports_scooter"
        moped4.image = "50cc_sports_scooter.png"
         moped4.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike1.png"
        moped4.latitude = 51.597149
        moped4.longitude  = -0.336057
        moped4.address = "bike shop, 1 high st"
        moped4.telephone =  "+44 208 1234"
        moped4.manufacture = "50cc scooter"
         addData(object: moped4)
    
        let moped5 = Moped()
        moped5.name = "50cc_viper_scooter"
        moped5.image = "50cc_viper_scooter.png"
         moped5.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike4.png"
        moped5.latitude = 51.597149
        moped5.longitude  = -0.336057
        moped5.address = "bike shop, 1 high st"
        moped5.telephone =  "+44 208 1234"
        moped5.manufacture = "50cc scooter"
          addData(object: moped5)
        
        let moped6 = Moped()
        moped6.name = "50cc_ninja_scooter"
        moped6.image = "50cc_ninja_scooter.png"
         moped6.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike2.png"
        moped6.latitude = 51.597149
        moped6.longitude  = -0.336057
        moped6.address = "bike shop, 1 high st"
        moped6.telephone =  "+44 208 1234"
        moped6.manufacture = "50cc scooter"
         addData(object: moped6)
        
        let moped7 = Moped()
        moped7.name = "50cc_tommy_scooter"
        moped7.image = "50cc_tommy_scooter.png"
         moped7.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike5.png"
        moped7.latitude = 51.597149
        moped7.longitude  = -0.336057
        moped7.address = "bike shop, 1 high st"
        moped7.telephone =  "+44 208 1234"
        moped7.manufacture = "50cc scooter"
          addData(object: moped7)
        
        let moped8 = Moped()
        moped8.name =  "50cc_spyder_scooter"
        moped8.image = "50cc_spyder_scooter.png"
        moped8.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike8.png"
        moped8.latitude = 51.597149
        moped8.longitude  = -0.336057
        moped8.address = "bike shop, 1 high st"
        moped8.telephone =  "+44 208 1234"
        moped8.manufacture = "50cc scooter"
        addData(object: moped8)
        
        let moped10 = Moped()
        moped10.name =  "125cc_spyder_scooter"
        moped10.image = "125cc_spyder_scooter.png"
         moped10.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike9.png"
        moped10.latitude = 51.597149
        moped10.longitude  = -0.336057
        moped10.address = "bike shop, 1 high st"
        moped10.telephone =  "+44 208 1234"
        moped10.manufacture = "125cc scooter"
          addData(object: moped10)
        
        let moped11 = Moped()
        moped11.name = "125cc_milan_scooter"
        moped11.image = "125cc_milan_scooter.png"
         moped11.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike10.png"
        moped11.latitude = 51.597149
        moped11.longitude  = -0.336057
        moped11.address = "bike shop, 1 high st"
        moped11.telephone =  "+44 208 1234"
        moped11.manufacture = "125cc scooter"
          addData(object: moped11)
        
        let moped12 = Moped()
        moped12.name = "125cc_cobra_scooter"
        moped12.image = "125cc_cobra_scooter.png"
         moped12.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike11.png"
        moped12.latitude = 51.597149
        moped12.longitude  = -0.336057
        moped12.address = "bike shop, 1 high st"
        moped12.telephone =  "+44 208 1234"
        moped12.manufacture = "125cc scooter"
          addData(object: moped12)
        
        let moped13 = Moped()
        moped13.name = "125cc_scorpion_scooter"
        moped13.image = "125cc_scorpion_scooter.png"
         moped13.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike12.png"
        moped13.latitude = 51.597149
        moped13.longitude  = -0.336057
        moped13.address = "bike shop, 1 high st"
        moped13.telephone =  "+44 208 1234"
        moped13.manufacture = "125cc scooter"
          addData(object: moped13)
        
        let moped14 = Moped()
        moped14.name = "125cc_cruiser_scooter"
        moped14.image = "125cc_cruiser_scooter.png"
         moped14.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike14.png"
        moped14.latitude = 51.597149
        moped14.longitude  = -0.336057
        moped14.address = "bike shop, 1 high st"
        moped14.telephone =  "+44 208 1234"
        moped14.manufacture = "125cc scooter"
          addData(object: moped14)
        
        let moped15 = Moped()
        moped15.name = "125cc_viper_scooter"
        moped15.image = "125cc_viper_scooter.png"
         moped15.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike16.png"
        moped15.latitude = 51.597149
        moped15.longitude  = -0.336057
        moped15.address = "bike shop, 1 high st"
        moped15.telephone =  "+44 208 1234"
        moped15.manufacture = "125cc scooter"
          addData(object: moped15)
        
        let moped16 = Moped()
        moped16.name = "125cc_tommy_scooter"
        moped16.image = "125cc_tommy_scooter.png"
         moped16.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike13.png"
        moped16.latitude = 51.597149
        moped16.longitude  = -0.336057
        moped16.address = "bike shop, 1 high st"
        moped16.telephone =  "+44 208 1234"
        moped16.manufacture = "125cc scooter"
          addData(object: moped16)
        
        let moped17 = Moped()
        moped17.name = "125cc_classic_scooter"
        moped17.image = "125cc_classic_scooter.png"
         moped17.imageUrl = "https://www.scooter.co.uk/images/new/partial_images/no_price/bike15.png"
        moped17.latitude = 51.597149
        moped17.longitude  = -0.336057
        moped17.address = "bike shop, 1 high st"
        moped17.telephone =  "+44 208 1234"
        moped17.manufacture = "125cc scooter"
         addData(object: moped17)
        

        
        
    }

    func countRceords()-> Int {
         let realm = try! Realm()
         let mopeds = realm.objects(Moped.self)
        return mopeds.count
    }
    
}
