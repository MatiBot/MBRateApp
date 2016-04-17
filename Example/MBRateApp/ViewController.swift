//
//  ViewController.swift
//  MBRateApp
//
//  Created by Mati Bot on 04/16/2016.
//  Copyright (c) 2016 Mati Bot. All rights reserved.
//

import UIKit
import MBRateApp

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var rateUsInfo = MBRateUsInfo()
        
        rateUsInfo.title = "Enjoying The League?"
        rateUsInfo.titleImage = UIImage(named: "icon")
        rateUsInfo.itunesId = "893653132"
        MBRateUs.sharedInstance.rateUsInfo = rateUsInfo
    }


    @IBAction func showRateUsPopup(sender: UIButton) {
        MBRateUs.sharedInstance.showRateUs(self
            , positiveBlock: { () -> Void in
                let alert = UIAlertController(title: "MBAppRate", message: "User rated the app", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }, negativeBlock: { () -> Void in
                let alert = UIAlertController(title: "MBAppRate", message: "User doesn't like the app", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }) { () -> Void in
                let alert = UIAlertController(title: "MBAppRate", message: "User dismissed screen", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
        }
    }
}

