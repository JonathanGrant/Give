//
//  ProfileInputViewController.swift
//  Give
//
//  Created by shiga yuichi on 2015/07/17.
//  Copyright (c) 2015年 Jonathan Grant. All rights reserved.
//

import Foundation
import Parse
import ParseUI

class ProfileInputViewController: UIViewController  {
    @IBOutlet weak var birthPlaceField: UITextField!
    @IBOutlet weak var nameField: UILabel!
    
    @IBOutlet weak var profileImage: PFImageView!
    @IBOutlet weak var purposeField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var user :PFUser  = PFUser.currentUser()!
        self.birthPlaceField.text = user["username"] as! String
        
        self.nameField.text = user["username"] as! String
        
        profileImage.file = user["photo"] as! PFFile
        profileImage.loadInBackground()

        
        /*
        PFSession.getCurrentSessionInBackgroundWithBlock {(session :PFSession?, error :NSError?) -> Void in
            println(session?.sessionToken)
        }
*/
    }
    
    @IBAction func didCreateTap(sender: AnyObject) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}