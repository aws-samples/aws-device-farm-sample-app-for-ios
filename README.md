# AWS Device Farm Sample App for iOS

This is a sample native iOS app that contains most of the stock iOS components and elements. It contains a single Calabash test to get you started. You can also use this app with the AWS Device Farm [Built-in Fuzz Testing](http://docs.aws.amazon.com/devicefarm/latest/developerguide/test-types-built-in-fuzz.html)

Please use this app and example test suites as a reference for your own Device Farm tests.

#### Notes
All of the views are programatically created within the app. Storyboard or XIB files are not used. This is to prevent merge conflicts in the future. 

## Getting Started
In order to run this app within Device Farm you can either use the preassembled IPA or create it yourself.

#### Building Project with Xcode
1. Select the Calabash target (if built with Calabash) and select a iOS Device
2. Use the Product/ Build for Running option
<img src="file:///Users/scottgo/workspace/Kanapka/KanapkaiOSReferenceApp/ADFiOSReferenceApp/README_Images/build-ios.gif" width=1000 />

#### Packling and Creating IPA
1. go into your build directory: ```~/Library/Developer/Xcode/DerivedData/ProjectName/Build/Products/Debug-iphoneos```
2. create a new directory named "Payload"
3. move the appName.app folder into Payload
4. Zip payload and give it the IPA extension  

<img src="file:///Users/scottgo/workspace/Kanapka/KanapkaiOSReferenceApp/ADFiOSReferenceApp/README_Images/xcode-ipa.gif" width=700 />

## Testing on Device Farm
Follow the steps in the official AWS Device Farm documentation for:

1. [Built-in Fuzz Testing](http://docs.aws.amazon.com/devicefarm/latest/developerguide/test-types-built-in-fuzz.html)
2. [Calabash Testing](http://docs.aws.amazon.com/devicefarm/latest/developerguide/test-types-ios-calabash.html)

# Strategies for Specific Scenarios

|Component |iOS Implementation|
|----------|----------------------|
|Alerts: [Modal View](https://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/ModalViewControllers/ModalViewControllers.html****), [Alerts](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIAlertView_Class/), [Pop Overs (only works on iPads))](https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/Popovers.html)   | [source code]()  |
|Static Page|[source code]()|
|Login Page|[source code]()|
|[Navigation Controllers](https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/NavigationControllers.html)|[source code]()|
|Expected Crash|[source code]()|
|[Web View](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWebView_Class/)| [source code]() - [Calabash Test]()|


## Strategies for Native Features

|Feature |iOS Implementation|
|--------|----------------------|
|[Camera](https://developer.apple.com/library/ios/documentation/AudioVideo/Conceptual/CameraAndPhotoLib_TopicsForIOS/Introduction/Introduction.html)  |[source code]() |
|[Image Gallery](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UICollectionView_class/)|[source code]()|
|[Scroll View](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIScrollView_Class/)|[source code]()|
|Out of View Content|[source code]()|
|[Video](https://developer.apple.com/library/ios/documentation/MediaPlayer/Reference/MediaPlayer_Framework/)|[source code]()|
|[Table of Elements](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableView_Class/)|[source code]()|

## Strategies for Testing Inputs

|Component |iOS Implementation|
|--------------|---------|
|[DatePicker](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDatePicker_Class/)|[source code]()|
|[ContactAddButton](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/UIKitUICatalog/UIButton.html)|[source code]()|
|[TextView](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITextView_Class/)|[source code]()|
|[Labels](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UILabel_Class/)|[source code]()|
|[Text Input](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITextField_Class/)|[source code]()|
|[Gestures Input](https://developer.apple.com/library/ios/documentation/EventHandling/Conceptual/EventHandlingiPhoneOS/GestureRecognizer_basics/GestureRecognizer_basics.html)|[source code]()|
|[Refresh Control](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIRefreshControl_class/)|[source code]()|
|[Button](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/UIKitUICatalog/UIButton.html)|[source code]()|
|[Data Picker](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDatePicker_Class/)|[source code]()|
|[Switch View](https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UISwitch_Class/index.html)|[source code]()|

## Strategies for Navigation
|Component |iOS Implementation|
|--------------|---------|
|[Tab Bar](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITabBarController_Class/)|[source code]()|
|[Page Viewer](https://developer.apple.com/library/prerelease/ios//documentation/UIKit/Reference/UIPageViewControllerClassReferenceClassRef/index.html)|[source code]()|