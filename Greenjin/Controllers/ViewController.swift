//
//  Login-ViewController.swift
//  Greenjin
//
//  Created by Mahesh lad on 13/08/2018.
//  Copyright © 2018 mahesh lad. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import CoreData

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        
        self.view.addSubview(loginButton)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (FBSDKAccessToken.current() != nil) {
            // User is logged in, do work such as go to next view controller.
            print("loged in..")
            
            self.performSegue(withIdentifier: "showHome", sender: self)
        } else {
            
            print("Not loged in..")
            
        }
    }
    
    // MARK: -- Facebook Login
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if ((error) != nil)
        {
            print(error?.localizedDescription ?? "error occured");
        }
        else if (result.isCancelled)
        {
            print("Cancell");
        }
        else
        {
            print("Login Sucessfull");
            
            self.performSegue(withIdentifier: "showHome", sender: self)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Loged out...")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHome"{
            //  var vc = segue.destination as! HomeViewController
            // vc.data = "Data you want to pass"
            //Data has to be a variable name in your RandomViewController
        }
    }
    
    
    @IBAction func  registerTap() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //context
        let context = appDelegate.persistentContainer.viewContext
        //entity
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        
        //   newUser.setValue("mahesh", forKey: "username")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.predicate = NSPredicate(format: "username = %@", txtUsername.text!)
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request) as! [User]
            if(result.count >= 1){
                //already exists
                if ((result[0].password == txtPassword.text) && (result[0].username == txtUsername.text)) {
                    print("already exists")
                    DispatchQueue.main.async  {
                        self.performSegue(withIdentifier: "showHome", sender: self)
                    }
                } else {
                    print("invalid username/password")
                    
                    let alert = UIAlertController(title: "Invalid", message: "username/password ", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
//11.04
//                    // create the alert
//                    let alert = UIAlertController(title: "Invalid", message: "username/password .", preferredStyle: UIAlertController.Style.alert)
//                    
//                    // add an action (button)
//                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                    
//                    // show the alert
//                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                //save
                let newUser = NSManagedObject(entity: entity!, insertInto: context)
                
                newUser.setValue(txtUsername.text, forKey: "username")
                newUser.setValue(txtPassword.text, forKey: "password")
                do {
                    try context.save()
            
                    print("Object Saved.")
                    self.performSegue(withIdentifier: "showHome", sender: self)
                } catch {
                    print("Failed saving")
                }
            }
            
        } catch {
            
            print("Failed")
        }
        
    }
    
    
    
}

