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
    public var backgroundColor = UIColor.white
    public var positiveButtonColor = UIColor.blue
    public var negativeButtonColor = UIColor.blue
    public var textColor = UIColor.black
    public var emptyStarImage = nil as UIImage?
    public var fullStarImage = nil as UIImage?
    public var titleImage = nil as UIImage?
    public var dismissButtonColor = UIColor.black
    public var itunesId = nil as String?
}


class MBRateUsViewController : UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        shouldRate = false
        let podBundle = Bundle(for: type(of: self))
 
        starImageOn = UIImage(named: "rateus_on", in: podBundle, compatibleWith: nil)!
        starImageOff = UIImage(named: "rateus_off", in: podBundle, compatibleWith: nil)!
        
        super.init(coder: aDecoder)
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var resultLabel : UILabel!
    @IBOutlet var starsMask : UIView!
    @IBOutlet var callToActionButton : UIButton!
    @IBOutlet var starButtons : [UIButton]!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    
    var rateUsInfo : MBRateUsInfo?
    var positiveBlock : (()->Void)?
    var negativeBlock : (()->Void)?
    var dismissBlock : (()->Void)?
    
    var shouldRate : Bool
    var starImageOn : UIImage
    var starImageOff : UIImage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.callToActionButton.layer.cornerRadius = 6.0
        
        self.titleLabel.text = self.rateUsInfo?.title
        self.subtitleLabel.text = self.rateUsInfo?.subtitle
        self.view.backgroundColor = self.rateUsInfo?.backgroundColor
        self.titleLabel.textColor = self.rateUsInfo?.textColor
        self.subtitleLabel.textColor = self.rateUsInfo?.textColor
        self.resultLabel.textColor = self.rateUsInfo?.textColor
        
        if let fullStar = self.rateUsInfo?.fullStarImage {
            self.starImageOn = fullStar
        }
        
        if let emptyStar = self.rateUsInfo?.fullStarImage {
            self.starImageOff = emptyStar
        }
        
        for button: UIButton in self.starButtons {
            button.setImage(starImageOff, for: UIControlState())
        }
        
        self.imageView.image = self.rateUsInfo?.titleImage
        
        self.dismissButton.tintColor = self.rateUsInfo?.dismissButtonColor
    }
    

    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: { _ in self.dismissBlock?()})
    }
    
    @IBAction func starTouchedDown(_ sender: UIButton) {
        for button: UIButton in self.starButtons {
            if button.tag <= sender.tag {
                button.setImage(starImageOn, for: UIControlState())
            }
        }
    }
    
    @IBAction func starTouchedOutside(_ sender: UIButton) {
        for button: UIButton in self.starButtons {
            if button.tag <= sender.tag {
                button.setImage(starImageOff, for: UIControlState())
            }
        }
    }
    
    @IBAction func starTouched(_ sender: UIButton) {
        self.starsMask.isHidden = false
        if sender.tag >= 4 {
            self.resultLabel.text = self.rateUsInfo?.positive
            self.callToActionButton.setTitle("Rate in the AppStore", for: UIControlState())
            self.shouldRate = true
            self.callToActionButton.backgroundColor = self.rateUsInfo?.positiveButtonColor
        }
        else {
            self.resultLabel.text = self.rateUsInfo?.negative
            self.callToActionButton.setTitle("Send us feedback", for: UIControlState())
            self.shouldRate = false
            self.callToActionButton.backgroundColor = self.rateUsInfo?.negativeButtonColor
        }
        self.resultLabel.alpha = 0.0
        self.callToActionButton.alpha = 0.0
        self.resultLabel.isHidden = false
        self.callToActionButton.isHidden = false
        UIView.animate(withDuration: 0.5, animations: {() -> Void in
            self.resultLabel.alpha = 1.0
            self.callToActionButton.alpha = 1.0
        })
    }
    
    @IBAction func callToActionTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: {
            if self.shouldRate {
                if let itunesId = self.rateUsInfo?.itunesId {
                    UIApplication.shared.openURL(URL(string: "http://itunes.apple.com/app/id\(itunesId)")!)
                }

                self.positiveBlock?()
            }else {
                self.negativeBlock?()
            }
        })
    }
}
