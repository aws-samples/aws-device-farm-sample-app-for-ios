# AWS Device Farm Sample App for iOS

This is a sample native iOS app that contains many of the stock iOS components and elements. It also contains multiple [Calabash tests](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/featuresÂ) to get you started. You can also use this app with the AWS Device Farm [Built-in Fuzz Test](http://docs.aws.amazon.com/devicefarm/latest/developerguide/test-types-built-in-fuzz.html).

You can use this app and example test suite as a reference for your own Device Farm tests.

#### Notes
All of the views are programatically created within the app. Storyboard or XIB files are not used. This is to prevent merge conflicts in the future.

## Getting Started
In order to run this app within Device Farm you will need to create a local copy of this repository and build the application from source.

#### Building Project with Xcode
1. Select the Calabash target (if built with Calabash) and select an iOS Device
2. Use the `Product/Build for Running` option

<img src="https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/README_Images/build-ios.gif" width=1000 />

#### Packing and Creating IPA
1. Go into your build directory: ```~/Library/Developer/Xcode/DerivedData/ProjectName/Build/Products/Debug-iphoneos```
2. Create a new directory named "Payload"
3. Move the appName.app folder into the "Payload" folder
4. Zip the "Payload" folder and give it a .ipa extension

<img src="https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/README_Images/xcode-ipa.gif" width=700 />

## Testing on Device Farm
Follow the steps in the official AWS Device Farm documentation for:

1. [Built-in Fuzz Testing](http://docs.aws.amazon.com/devicefarm/latest/developerguide/test-types-built-in-fuzz.html)
2. [Calabash Testing](http://docs.aws.amazon.com/devicefarm/latest/developerguide/test-types-ios-calabash.html)

# Examples of Specific Scenarios
|Component |App Implementation|
|----------|----------------------|
|Alerts: [Modal View](https://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/ModalViewControllers/ModalViewControllers.html****), [Alerts](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIAlertView_Class/), [Pop Overs (only works on iPads)](https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/Popovers.html)   | [source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/NotificationsViewController.m) - [Calabash Test](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/features/step_definitions/alert_page.rb)|
|Static Page|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/HomePageViewController.m) - [Calabash Test](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/features/step_definitions/homepage.rb)|
|Login Page|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/LogInViewController.m) - [Calabash Test](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/features/step_definitions/login_page.rb)|
|[Navigation Controllers](https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/NavigationControllers.html)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/NestedNavigationViewController.m) - [Calabash Test](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/features/step_definitions/nested_views_page.rb)|
|Expected Crash|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/CrashViewController.m)|
|[Web View](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWebView_Class/)| [source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/WebViewController.m) - [Calabash Test](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/features/step_definitions/network_test.rb)|

## Examples of Native Features
|Feature |App Implementation|
|--------|----------------------|
|[Camera](https://developer.apple.com/library/ios/documentation/AudioVideo/Conceptual/CameraAndPhotoLib_TopicsForIOS/Introduction/Introduction.html)  |[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/CameraViewController.m) |
|[Image Gallery](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UICollectionView_class/)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/ImageGalleryViewController.m)|
|[Scroll View](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIScrollView_Class/)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/ScrollingViewController.m)|
|Out of View Content|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/ScrollOutOfViewViewController.m)|
|[Video](https://developer.apple.com/library/ios/documentation/MediaPlayer/Reference/MediaPlayer_Framework/)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/MediaPlayerViewController.m)|
|[Table of Elements](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableView_Class/)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/ElementsTableViewController.m)|

## Examples of Inputs
|Component |App Implementation|
|--------------|---------|
|[DatePicker](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDatePicker_Class/)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/DatePickerViewController.m)|
|[ContactAddButton](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/UIKitUICatalog/UIButton.html)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/ContactAddButtonViewController.m)|
|[TextView](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITextView_Class/)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/TextViewController.m)|
|[Labels](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UILabel_Class/)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/LabelsViewController.m)|
|[Text Input](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITextField_Class/)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/InputTextFieldViewController.m)|
|[Gestures Input](https://developer.apple.com/library/ios/documentation/EventHandling/Conceptual/EventHandlingiPhoneOS/GestureRecognizer_basics/GestureRecognizer_basics.html)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/GesturesViewController.m)|
|[Refresh Control](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIRefreshControl_class/)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/RefreshControlViewController.m)|
|[Button](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/UIKitUICatalog/UIButton.html)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/SubmitButtonViewController.m)|
|[Data Picker](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIPickerView_Class/)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/DataPickerViewController.m)|
|[Switch View](https://developer.apple.com/library/prerelease/ios/documentation/UIKit/Reference/UISwitch_Class/index.html)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/SwitchViewController.m)|

## Examples of Navigation
|Component |App Implementation|
|--------------|---------|
|[Tab Bar](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITabBarController_Class/)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/MainTabBarViewController.m)|
|[Page Viewer](https://developer.apple.com/library/prerelease/ios//documentation/UIKit/Reference/UIPageViewControllerClassReferenceClassRef/index.html)|[source code](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/ADFiOSReferenceApp/InputControlsPageViewController.m)|
