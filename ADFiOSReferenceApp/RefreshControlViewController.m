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


#import "RefreshControlViewController.h"

@interface RefreshControlViewController ()
@property UILabel *timeDisplay;
@property UIRefreshControl *refreshControl;
@property UIScrollView *scrollView;
@end

static NSString* const TEXT_FIELD_PLACEHOLDER_TEXT = @"Refresh to get the time";

/**
 *  A controller for a refresh control view controller
 */
@implementation RefreshControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

-(void)setUpView{
    _timeDisplay = [[UILabel alloc] initWithFrame:
                    CGRectMake(0, [self getTopPositionRounded] + [self getLargeHeightPadding], [self getWidthMinusSmallPadding], 0)];
    _timeDisplay.text = TEXT_FIELD_PLACEHOLDER_TEXT;
    [_timeDisplay sizeToFit];
    [self centerViewByWidth:_timeDisplay];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:
                   CGRectMake(0, [self getTopPosition], self.view.frame.size.width, self.view.frame.size.height)];
    
    _refreshControl = [[UIRefreshControl alloc] init];
    [_refreshControl addTarget:self action:@selector(refreshEvent:) forControlEvents:UIControlEventValueChanged];
    _scrollView.showsVerticalScrollIndicator = NO;
    [_scrollView addSubview:_refreshControl];
    [self.view addSubview:_scrollView];
    [self.view addSubview:_timeDisplay];
}

/**
 *  Sets the view larger so you have space to pull to swipe down
 */
-(void)viewWillLayoutSubviews{
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+88);
}

/**
 *  A event for when the refresh occurs 
 *
 *  Gets the current time and sets it to the display
 *
 *  @param refreshControl the refresh control
 */
-(void)refreshEvent:(UIRefreshControl *)refreshControl{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setTimeStyle:NSDateFormatterLongStyle];
    _timeDisplay.text = [df stringFromDate:[NSDate date]];
    
    [_timeDisplay sizeToFit];
    [self centerViewByWidth:_timeDisplay];

    [refreshControl endRefreshing];
}

@end
