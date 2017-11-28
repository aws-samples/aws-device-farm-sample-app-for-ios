# AWS Device Farm Sample App for iOS

This is a sample native iOS app that contains many of the stock iOS components and elements. It also contains multiple [Calabash tests](https://github.com/awslabs/aws-device-farm-sample-app-for-ios/tree/master/features) to get you started. You can also use this app with the AWS Device Farm [Built-in Fuzz Test](http://docs.aws.amazon.com/devicefarm/latest/developerguide/test-types-built-in-fuzz.html).

You can use this app and example test suite as a reference for your own Device Farm tests.

##### **Notes**
All of the views are programatically created within the app. Storyboard or XIB files are not used. This is to prevent merge conflicts in the future.

Explicit delays are occasionally added to the tests to allow the page to fully render, they are commented as such in the code.

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

## Using XCUI Recorder

#### Pre-Requisites

1. Xcode 9 or above
2. iOS simulator downloaded or a physical iOS device.

#### Steps:

1. Download the AWS Device Farm iOS sample app.
2. Open the project in Xcode.
3. We will generate tests XCUI using a new test target.
  * Select File —> New —> Target —> iOS UI Testing Bundle. </br>
  * Click Next. </br>
  * Enter a Product Name </br>
  For e.g. AWSDeviceFarmiOSReferenceAppUITests_Mock </br>
  * If you have a apple developer account you can choose that for the Team option. </br>
  * Choose Language as Swift. </br>
  * Click Finish.
4. In your project navigator you should now see the new target swift files generated. Open AWSDeviceFarmiOSReferenceAppUITests_Mock.swift.
5. The file will have setUp(), tearDown() and a testExample() function. testExample() is the function where our test code generated through XCUI test recorder will live. Click inside the scope of function testExample().
6. Select a target device for the recording. Click on the red record button present in the Debug bar as shown below. This will open up the selected simulator for you to record your UI interactions. </br>
<img src="https://github.com/awslabs/aws-device-farm-sample-app-for-ios/blob/master/README_Images/record-xcui.png" width=1000 />

7. When the app opens up on the simulator, inside the app click on More —> Alerts —> Modal --> OK
8. Go to Xcode and press the record button again to stop recording the test. We now have the test code generated to test Alert section of the sample app.

   We will add an XCAssert after the recording is complete to check if the modal view is present. This can done using the code snippet :
```
XCTAssertNotNil(app.staticTexts["This is a modal view"])
```

9. The project has existing XCUI tests which we do not want to run. We will disable the existing tests and only run our generated tests. Go to Product —> Scheme —>Edit Scheme. Select Build on left hand side. Uncheck all existing test targets except AWSDeviceFarmiOSReferenceApp and your generated test target AWSDeviceFarmiOSReferenceAppUITests_Mock
10. For specifying which tests to build select Test on the left side. Click on ‘+’ . Choose only your test target. Click Add. Click Close in the main window.
11. To build the tests for simulator go to Product —> Build for Testing. </br>
**Note**: If you want to run on Device Farm you should build and run your tests against a real physical device. Tests build for simulator will not run on real devices. For the purpose of the instructions here we are going to consider simulator.
12. To run the tests go to Product —> Test. This will open up the simulator and run the tests.
13. We want to package and upload these tests to Device Farm to test it against a number of devices. </br>
To package the tests go to your Project explorer on the left hand side. Right click on AWSDeviceFarmiOSReferenceApp under Products folder —> Show in Finder. This will take to the location of your app and tests build output. Look for the runner app of your tests: AWSDeviceFarmiOSReferenceAppUITests_Mock-Runner. Create a folder named “Payload” case-sensitive anywhere in your file system. Copy the tests runner app inside Payload. Right click on Payload —> Compress Payload. Rename the extensions of the compressed zip file to .ipa. When asked if you want to keep .ipa option choose yes. This is your test IPA that can be uploaded to AWS Device Farm.
14. You can build an IPA of the app using your developer account or a pre-built version of the app and tests can be found [here](https://s3.console.aws.amazon.com/s3/buckets/prebuiltappsreinvent2017/).
