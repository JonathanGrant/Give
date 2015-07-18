//
//  LoginViewController.swift
//  Give
//
//  Created by shiga yuichi on 2015/07/17.
//  Copyright (c) 2015年 Jonathan Grant. All rights reserved.
//

import Foundation
import Parse

class LoginViewController: UIViewController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didLoginTap(sender: AnyObject) {
        fblogin()
    }
    
    func fblogin(){
        PFFacebookUtils.logInInBackgroundWithReadPermissions(["email"], block: {
            (user: PFUser?, error: NSError?) -> Void in
            if let facebookUser = user{
                // Your app now has publishing permissions for the user
                println("succeeded to facebook login")
                println(facebookUser)
                println(PFUser.currentUser()?.objectId)
            } else {
                println(error)
            }
        })
        
    }
}