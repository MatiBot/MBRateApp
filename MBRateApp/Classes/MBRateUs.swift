//
//  MBRateUs.swift
//  Pods
//
//  Created by Mati Bot on 16/04/2016.
//
//

import Foundation


open class MBRateUs{

    open static let sharedInstance = MBRateUs()

    open var rateUsInfo = MBRateUsInfo()
    
    open func showRateUs(_ base:UIViewController, positiveBlock:@escaping ()->Void, negativeBlock:@escaping ()->Void, dismissBlock:@escaping ()->Void){
        let podBundle = Bundle(for: type(of: self))
        let storyboard = UIStoryboard(name: "RateUs", bundle: podBundle)
        let vc = storyboard.instantiateInitialViewController() as! MBRateUsViewController
        
        vc.positiveBlock = positiveBlock
        vc.negativeBlock = negativeBlock
        vc.dismissBlock = dismissBlock
        
        vc.rateUsInfo = self.rateUsInfo
        
        base.present(vc, animated: true, completion: nil)
    }
    
}
