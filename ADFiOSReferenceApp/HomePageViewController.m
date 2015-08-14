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


#import "HomePageViewController.h"

/**
 *  A static homepage for the app
 *
 *  Contains the app name and version number
 */
@interface HomePageViewController ()
@property UILabel *homepageTitle;
@property UILabel *versionNumber;
@end

static NSString* const HOME_PAGE_TITLE = @"AWS Device Farm Sample app";
static NSString* const HOME_PAGE_VERSION_NUMBER = @"Version 1";

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

/**
 *  Configures and creates view
 */
-(void)setUpView{
    _homepageTitle = [[UILabel alloc] initWithFrame:[self frameFromCGPoint:CGPointMake(0, [self getTopPositionRounded] + [self getSmallHeightPadding]) AndCGSize:CGSizeMake([self getWidthMinusLargePadding], 0)]];
    
    _versionNumber = [[UILabel alloc] initWithFrame:[self frameFromCGPoint:CGPointZero AndCGSize:CGSizeMake([self getWidthMinusLargePadding], 0)]];
    
    [self configureLabel:_homepageTitle withText:HOME_PAGE_TITLE];
    [self configureLabel:_versionNumber withText:HOME_PAGE_VERSION_NUMBER];

    [self centerViewByWidth:_versionNumber];
    [self centerViewByWidth:_homepageTitle];

    [self putView:_versionNumber belowView:_homepageTitle withPadding:[self getSmallHeightPadding]];
    
    [self.view addSubview:_homepageTitle];
    [self.view addSubview:_versionNumber];
}

/**
 *  Configures label
 *
 *  @param label   the label to configure
 *  @param content the content of the label
 */
-(void)configureLabel:(UILabel*)label withText:(NSString*)content{
    label.font = [UIFont largeBoldFont];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = content;
    [label sizeToFit];
}

@end
