//
//  ViewController.swift
//  Give
//
//  Created by Jonathan Grant on 7/17/15.
//  Copyright (c) 2015 Jonathan Grant. All rights reserved.
//

import UIKit
import Social
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shareToFacebook(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            var facebookSheet: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText("Check out my amazing campaign app on Give!")
            self.presentViewController(facebookSheet, animated: true, completion: nil)
        } else {
            var alert = UIAlertController(title: "Error", message: "Please log in to Facebook from your settings.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

    @IBAction func shareToTwitter(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            var twitterSheet: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterSheet.setInitialText("Check out my amazing campaign app on Give!")
            self.presentViewController(twitterSheet, animated: true, completion: nil)
        } else {
            var alert = UIAlertController(title: "Error", message: "Please log in to Twitter from your settings.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func sendFromEmail(sender: AnyObject) {
        var emailTitle = "Give: The Campaigning App"
        var messageBody = "Check out my amazing campaign app on Give!"
        var toRecipients = ["grantj@usc.edu"] //optional, maybe find a way to select all contacts
        
        var mailController: MFMailComposeViewController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setSubject(emailTitle)
        mailController.setMessageBody(messageBody, isHTML: false)
        mailController.setToRecipients(toRecipients)
        
        self.presentViewController(mailController, animated: true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        switch result.value {
            case MFMailComposeResultCancelled.value:
                print("Mail Cancelled")
            case MFMailComposeResultSaved.value:
                print("Mail Saved")
            case MFMailComposeResultSent.value:
                print("Mail Cancelled")
            case MFMailComposeResultFailed.value:
                print("Mail Failed")
        default:
            break
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func sendFromTextMessage(sender: AnyObject) {
        var textMessage = MFMessageComposeViewController() //doesn;t work right now
        textMessage.body = "Check out my amazing campaign app on Give!"
        textMessage.recipients = ["6507993840"]
        textMessage.messageComposeDelegate = self
        self.presentViewController(textMessage, animated: true, completion: nil)
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        switch result.value {
        case MessageComposeResultCancelled.value:
            print("Message Cancelled")
        case MessageComposeResultFailed.value:
            print("Message Failed")
        case MessageComposeResultSent.value:
            print("Message Sent")
        default:
            break
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

