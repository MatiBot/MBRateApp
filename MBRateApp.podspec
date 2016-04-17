#
# Be sure to run `pod lib lint MBRateApp.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = "MBRateApp"
s.version          = "0.1.2"
s.summary          = "A customizable interstitial app rate screen with cool design"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
A customizable interstitial app rate screen with cool design.
You can change the colors of almost every element on the screen and get callbacks of what the user chose to do.
DESC

s.homepage         = "https://github.com/matibot/MBRateApp"
# s.screenshots     = "https://raw.githubusercontent.com/MatiBot/MBRateApp/master/Screenshots/screenshot1.png", "https://raw.githubusercontent.com/MatiBot/MBRateApp/master/Screenshots/screenshot2.png"
s.license          = 'MIT'
s.author           = { "Mati Bot" => "matibot@gmail.com" }
s.source           = { :git => "https://github.com/matibot/MBRateApp.git", :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/b0tnik'

s.ios.deployment_target = '8.0'

s.source_files = 'MBRateApp/Classes/**/*'

s.resource_bundles = {
'MBRateApp' => ['Pod/Assets/*.png']
}

s.resources = 'MBRateApp/Assets/**/*.storyboard'


# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'
# s.dependency 'AFNetworking', '~> 2.3'
end
