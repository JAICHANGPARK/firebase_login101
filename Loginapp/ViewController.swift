//
//  ViewController.swift
//  Loginapp
//
//  Created by PARK JAICHANG on 8/1/16.
//  Copyright © 2016 JAICHANGPARK. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 버튼만들기
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .Plain, target: self, action: #selector(handleLogout))
        
        if FIRAuth.auth()?.currentUser?.uid == nil{
            //handleLogout()
            performSelector(#selector(handleLogout), withObject: nil, afterDelay: 0)
            
            
        }
        
        //  let ref = FIRDatabase.database().referenceFromURL("https://loginapp-3f5ea.firebaseio.com/")
        // ref.updateChildValues(["someValue":123123])
    }
    
    func handleLogout(){
        
        do {
            
            try FIRAuth.auth()?.signOut()
        } catch let logoutError{
            
            print(logoutError)
            
        }
        
        let loginController = LoginController()
        
       presentViewController(loginController, animated: true, completion: nil)
        
        
        
    }

}

