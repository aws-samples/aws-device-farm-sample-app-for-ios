/* * Copyright 2014-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 * http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */


#import "MainTabBarViewController.h"
#import "UIColor+ColorExtension.h"
#import "UIFont+FontExtension.h"
//Tabbed Views
#import "WebViewController.h"
#import "NativeViewMenuNavigationViewController.h"
#import "NestedNavigationViewController.h"
#import "LogInViewController.h"
#import "InputControlsPageViewController.h"
#import "CrashViewController.h"
#import "CustomWebSiteNavigationViewController.h"
#import "HomePageViewController.h"
#import "NotificationsViewController.h"

@interface MainTabBarViewController ()
@property NSMutableArray *tabs;
@end

static NSString* const WEB_CONTROLLER_TITLE = @"Web";
static NSString* const WEB_CONTROLLER_IMAGE_NAME = @"ic_wifi_white";
static NSString* const CRASH_CONTROLLER_TITLE = @"Crash";
static NSString* const CRASH_CONTROLLER_IMAGE_NAME = @"ic_bug_report_white";
static NSString* const NATIVE_CONTROLLER_TITLE = @"Native";
static NSString* const NATIVE_CONTROLLER_IMAGE_NAME = @"ic_photo_camera_white";
static NSString* const NESTED_CONTROLLER_TITLE = @"Nested";
static NSString* const NESTED_CONTROLLER_IMAGE_NAME = @"ic_filter_1_white";
static NSString* const LOGIN_CONTROLLER_TITLE = @"Login";
static NSString* const LOGIN_CONTROLLER_IMAGE_NAME = @"ic_account_box_white";
static NSString* const INPUTS_CONTROLLER_TITLE = @"Inputs";
static NSString* const INPUTS_CONTROLLER_IMAGE_NAME = @"ic_input_white";
static NSString* const CUSTOM_WEB_CONTROLLER_TITLE = @"HTTP";
static NSString* const CUSTOM_WEB_CONTROLLER_IMAGE_NAME = @"ic_public_white";
static NSString* const NOTIFICATIONS_CONTROLLER_TITLE = @"Alerts";
static NSString* const NOTIFICATIONS_CONTROLLER_IMAGE_NAME = @"ic_announcement_white";
static NSString* const HOME_CONTROLLER_TITLE = @"Home";
static NSString* const HOME_CONTROLLER_IMAGE_NAME = @"ic_store_white";

/**
 *  The main tab bar navigation across the app.
 */
@implementation MainTabBarViewController

#pragma mark - View Initialization
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [self customizeTabBar];
    _tabs = [NSMutableArray new];
    [self loadTabs];
    self.viewControllers = _tabs;
}

/**
 *  Customization for the tab bar
 */
-(void)customizeTabBar{
    //set tab colors and fonts
    self.tabBar.barStyle = UIBarStyleBlack;
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor flatOffWhite],UITextAttributeTextColor, [UIFont smallFont],  UITextAttributeFont,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor flatOrange],UITextAttributeTextColor, nil] forState:UIControlStateSelected];
    [[UITabBar appearance] setTintColor:[UIColor flatOrange]];
}

#pragma mark - create and set up the tabs
-(void)setUpWebTab{
    WebViewController *webController = [[WebViewController alloc] initWithTitle:WEB_CONTROLLER_TITLE andImage:[UIImage imageNamed:WEB_CONTROLLER_IMAGE_NAME]];
    
    [_tabs addObject:webController];
}
-(void)setupCustomWebTab{
    CustomWebSiteNavigationViewController *customWebSiteNavigation = [[CustomWebSiteNavigationViewController alloc] initWithTitle:CUSTOM_WEB_CONTROLLER_TITLE andImage:[UIImage imageNamed:CUSTOM_WEB_CONTROLLER_IMAGE_NAME]];
    
    [_tabs addObject:customWebSiteNavigation];
}

-(void)setUpCrashTab{
    CrashViewController *crashController = [[CrashViewController alloc] initWithTitle:CRASH_CONTROLLER_TITLE andImage:[UIImage imageNamed:CRASH_CONTROLLER_IMAGE_NAME]];
    [_tabs addObject:crashController];
}

-(void)setUpNativeTab{
    NativeViewMenuNavigationViewController *nativeController = [[NativeViewMenuNavigationViewController alloc] initWithTitle:NATIVE_CONTROLLER_TITLE andImage:[UIImage imageNamed:NATIVE_CONTROLLER_IMAGE_NAME]];
    
    [_tabs addObject:nativeController];
}

-(void)setUpNestedTab{
    NestedNavigationViewController *nestedController = [[NestedNavigationViewController alloc] initWithTitle:NESTED_CONTROLLER_TITLE andImage:[UIImage imageNamed:NESTED_CONTROLLER_IMAGE_NAME]];
    
    [_tabs addObject:nestedController];
}

-(void)setUpLogin{
    LogInViewController *loginViewController = [[LogInViewController alloc] initWithTitle:LOGIN_CONTROLLER_TITLE andImage:[UIImage imageNamed:LOGIN_CONTROLLER_IMAGE_NAME]];
    [_tabs addObject:loginViewController];
}

-(void)setUpInputControlsTab{
    InputControlsPageViewController *inputControlsController = [[InputControlsPageViewController alloc] initWithTitle:INPUTS_CONTROLLER_TITLE andImage:[UIImage imageNamed:INPUTS_CONTROLLER_IMAGE_NAME]];
    [_tabs addObject:inputControlsController];
}


-(void)setUpHomePage{
    HomePageViewController *homePageController = [[HomePageViewController alloc] initWithTitle:HOME_CONTROLLER_TITLE andImage:[UIImage imageNamed:HOME_CONTROLLER_IMAGE_NAME]];
    
    [_tabs addObject:homePageController];
}


-(void)setUpNotificationTab{
    NotificationsViewController *notificationController = [[NotificationsViewController alloc] initWithTitle:NOTIFICATIONS_CONTROLLER_TITLE andImage:[UIImage imageNamed:NOTIFICATIONS_CONTROLLER_IMAGE_NAME]];
    
    [_tabs addObject:notificationController];
}

/**
 *  Loads all the tabs within the tab bar
 */
-(void)loadTabs {
    [self setUpHomePage];
    [self setupCustomWebTab];
    [self setUpNativeTab];
    [self setUpInputControlsTab];
    [self setUpNestedTab];
    [self setUpCrashTab];
    [self setUpNotificationTab];
    [self setUpWebTab];
    [self setUpLogin];
}

#pragma mark - Controller Events
/**
 *  Even called when the software keyboard is about to hide
 *
 *  Used to reposition the tab bar so that it can be at the bottom of the screen
 *
 *  @param notification the notification
 */
-(void)keyboardWillHide: (NSNotification *) notification {
    NSLog(@"keyboard will hide");
    [self.view layoutIfNeeded];
    NSLog(@"tab bar before %f %f",self.tabBar.frame.origin.x, self.tabBar.frame.origin.y);
    
    
    CGRect frame =  self.tabBar.frame;
    CGRect keyboard = [[notification.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSLog(@"keyboard size %f", keyboard.size.height);
    frame.origin.y = frame.origin.y + keyboard.size.height;
    [UIView animateWithDuration:[[notification.userInfo valueForKey:@"UIKeyboardAnimationDurationUserInfoKey"] floatValue] animations:^
     {
         [self.tabBar setFrame:frame];
     }];
    NSLog(@"tab bar after %f %f",self.tabBar.frame.origin.x, self.tabBar.frame.origin.y);
}

/**
 *  Event called when the software keyboard is about to show 
 *
 *  Used to reposition the tab bar so that it isn't hidden by the keyboard
 *
 *  @param notification the notification
 */
-(void)keyboardWillShow: (NSNotification *) notification {
    NSLog(@"keyboard will show");
    [self.view layoutIfNeeded];
    NSLog(@"tab bar before %f %f",self.tabBar.frame.origin.x, self.tabBar.frame.origin.y);
    
    CGRect frame =  self.tabBar.frame;
    CGRect keyboard = [[notification.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    frame.origin.y = frame.origin.y - keyboard.size.height;
    [UIView animateWithDuration:[[notification.userInfo valueForKey:@"UIKeyboardAnimationDurationUserInfoKey"] floatValue] animations:^
     {
         [self.tabBar setFrame:frame];
     }];
    NSLog(@"tab bar after %f %f",self.tabBar.frame.origin.x, self.tabBar.frame.origin.y);
}

@end
