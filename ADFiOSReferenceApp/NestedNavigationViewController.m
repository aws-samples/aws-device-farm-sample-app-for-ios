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


#import "NestedNavigationViewController.h"
#import "FirstViewController.h"

static NSString* const NEXT_VIEW_TITLE = @"View 1";
static NSString* const NEXT_VIEW_MESSAGE = @"This is the first view";

/**
 Creates the first view controller
 */
@implementation NestedNavigationViewController

-(id)initWithTitle:(NSString*)title andImage:(UIImage*)image{
    FirstViewController *firstVC = [[FirstViewController alloc] initWithTitle:NEXT_VIEW_TITLE andImage:nil andText:NEXT_VIEW_MESSAGE andIsLast:NO];
    self = [super initWithRootViewController:firstVC];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.tabBarItem.title = title;
        self.tabBarItem.image = image;
        self.view.autoresizesSubviews = NO;
        self.navigationController.navigationBar.autoresizesSubviews = NO;
    }
    return self;
}

@end
