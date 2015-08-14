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



#import "CustomWebSiteNavigationViewController.h"
#import "CustomWebSitePickerViewController.h"

@interface CustomWebSiteNavigationViewController ()
@property CustomWebSitePickerViewController *webSitePickerViewController;
@end

/**
 A controller to navigate to a specific web url
 */
@implementation CustomWebSiteNavigationViewController

-(id)initWithTitle:(NSString*)title andImage:(UIImage*)image {
    _webSitePickerViewController = [[CustomWebSitePickerViewController alloc] init];
    self = [super initWithRootViewController:_webSitePickerViewController];
    if (self) {
        self.view.autoresizesSubviews = NO;
        self.navigationController.navigationBar.autoresizesSubviews = NO;
        self.tabBarItem.title = title;
        self.tabBarItem.image = image;
    }
    return self;
}


@end
