//
//  ProfileInputViewController.swift
//  Give
//
//  Created by shiga yuichi on 2015/07/17.
//  Copyright (c) 2015年 Jonathan Grant. All rights reserved.
//

import Foundation
import Parse

class ProfileInputViewController: UIViewController  {
    @IBOutlet weak var birthPlaceField: UITextField!
    
    @IBOutlet weak var purposeField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var user :PFUser  = PFUser.currentUser()!
        self.birthPlaceField.text = user["username"] as! String
        
    }
    
    @IBAction func didCreateTap(sender: AnyObject) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}