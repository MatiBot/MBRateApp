//
//  MBRateUsViewController.swift
//  Pods
//
//  Created by Mati Bot on 16/04/2016.
//
//

import Foundation

public struct MBRateUsInfo {
    
    public init() { }
    
    public var title = "Enjoying this app?"
    public var subtitle = "Please rate your experience"
    public var positive = "Awesome!"
    public var negative = "Darn. we should have been better."
    public var rateInAppStoreButtonTitle = "Rate in the AppStore"
    public var sendUsFeedbackButtonTitle = "Send us feedback"
    public var backgroundColor = UIColor.whiteColor()
    public var positiveButtonColor = UIColor.blueColor()
    public var negativeButtonColor = UIColor.blueColor()
    public var textColor = UIColor.blackColor()
    public var emptyStarImage = nil as UIImage?
    public var fullStarImage = nil as UIImage?
    public var titleImage = nil as UIImage?
    public var dismissButtonColor = UIColor.blackColor()
    public var itunesId = nil as String?
    public var successResult = 4
}


class MBRateUsViewController : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var resultLabel : UILabel!
    @IBOutlet var starsMask : UIView!
    @IBOutlet var callToActionButton : UIButton!
    @IBOutlet var starButtons : [UIButton]!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    
    var rateUsInfo = MBRateUsInfo()
    var positiveBlock : (()->Void)?
    var negativeBlock : (()->Void)?
    var dismissBlock : (()->Void)?
    
    var shouldRate : Bool
    var starImageOn : UIImage
    var starImageOff : UIImage
    
    
    required init?(coder aDecoder: NSCoder) {
        shouldRate = false
        let podBundle = NSBundle(forClass: self.dynamicType)
        
        starImageOn = UIImage(named: "rateus_on", inBundle: podBundle, compatibleWithTraitCollection: nil)!
        starImageOff = UIImage(named: "rateus_off", inBundle: podBundle, compatibleWithTraitCollection: nil)!
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.callToActionButton.layer.cornerRadius = 6.0
        self.callToActionButton.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel.text = self.rateUsInfo.title
        self.subtitleLabel.text = self.rateUsInfo.subtitle
        self.view.backgroundColor = self.rateUsInfo.backgroundColor
        self.titleLabel.textColor = self.rateUsInfo.textColor
        self.subtitleLabel.textColor = self.rateUsInfo.textColor
        self.resultLabel.textColor = self.rateUsInfo.textColor
        
        if let fullStar = self.rateUsInfo.fullStarImage {
            self.starImageOn = fullStar
        }
        
        if let emptyStar = self.rateUsInfo.fullStarImage {
            self.starImageOff = emptyStar
        }
        
        for button: UIButton in self.starButtons {
            button.setImage(starImageOff, forState: .Normal)
        }
        
        self.imageView.image = self.rateUsInfo.titleImage
        
        self.dismissButton.tintColor = self.rateUsInfo.dismissButtonColor
    }
    
    
    @IBAction func dismiss(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: { _ in self.dismissBlock?()})
    }
    
    @IBAction func starTouchedDown(sender: UIButton) {
        for button: UIButton in self.starButtons {
            if button.tag <= sender.tag {
                button.setImage(starImageOn, forState: .Normal)
            }
        }
    }
    
    @IBAction func starTouchedOutside(sender: UIButton) {
        for button: UIButton in self.starButtons {
            if button.tag <= sender.tag {
                button.setImage(starImageOff, forState: .Normal)
            }
        }
    }
    
    @IBAction func starTouched(sender: UIButton) {
        self.starsMask.hidden = false
        
        if sender.tag >= self.rateUsInfo.successResult {
            self.resultLabel.text = self.rateUsInfo.positive
            self.callToActionButton
                .setTitle(self.rateUsInfo.rateInAppStoreButtonTitle, forState: .Normal)
            self.shouldRate = true
            self.callToActionButton.backgroundColor = self.rateUsInfo.positiveButtonColor
        }
        else {
            self.resultLabel.text = self.rateUsInfo.negative
            self.callToActionButton.setTitle(self.rateUsInfo.sendUsFeedbackButtonTitle, forState: .Normal)
            self.shouldRate = false
            self.callToActionButton.backgroundColor = self.rateUsInfo.negativeButtonColor
        }
        self.resultLabel.alpha = 0.0
        self.callToActionButton.alpha = 0.0
        self.resultLabel.hidden = false
        self.callToActionButton.hidden = false
        UIView.animateWithDuration(0.5, animations: {() -> Void in
            self.resultLabel.alpha = 1.0
            self.callToActionButton.alpha = 1.0
        })
    }
    
    @IBAction func callToActionTouched(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: {
            
            guard self.shouldRate else {
                self.negativeBlock?()
                return
            }
            
            if let itunesId = self.rateUsInfo.itunesId,
                url = NSURL(string: "http://itunes.apple.com/app/id\(itunesId)")
                where UIApplication.sharedApplication().canOpenURL(url) {
                UIApplication.sharedApplication().openURL(url)
                self.positiveBlock?()
            }
        })
    }
}