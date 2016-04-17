# MBRateApp

[![CI Status](http://img.shields.io/travis/Mati Bot/MBRateApp.svg?style=flat)](https://travis-ci.org/Mati Bot/MBRateApp)
[![Version](https://img.shields.io/cocoapods/v/MBRateApp.svg?style=flat)](http://cocoapods.org/pods/MBRateApp)
[![License](https://img.shields.io/cocoapods/l/MBRateApp.svg?style=flat)](http://cocoapods.org/pods/MBRateApp)
[![Platform](https://img.shields.io/cocoapods/p/MBRateApp.svg?style=flat)](http://cocoapods.org/pods/MBRateApp)

![](https://raw.githubusercontent.com/MatiBot/MBRateApp/master/Screenshots/MBChatApp.gif)
## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Customization

```swift
var rateUsInfo = MBRateUsInfo() //get the default settings
        
//override any attribute
rateUsInfo.title = "Enjoying The League?"
rateUsInfo.titleImage = UIImage(named: "icon")
rateUsInfo.itunesId = "893653132"
        
//set the value in the shared instance
MBRateUs.sharedInstance.rateUsInfo = rateUsInfo
```

### Presentation

```swift
MBRateUs.sharedInstance.showRateUs(self
        , positiveBlock: { () -> Void in
        //code to run when the user chose more than 3 stars and chose to rate in the app store
        }, negativeBlock: { () -> Void in
        //code to run when the user chose less than 4 stars and chose to send feedback
        }) { () -> Void in
        //code to run when the user dismissed that screen without choosing anything
}
```

## Requirements

## Installation

MBRateApp is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MBRateApp"
```

## Author

Mati Bot, matibot@gmail.com, [@b0tnik](https://twitter.com/b0tnik)

## License

MBRateApp is available under the MIT license. See the LICENSE file for more info.
