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


#import "ModalViewController.h"

@interface ModalViewController ()
@property UILabel *modalMessage;
@property UIButton *confirmButton;
@end

static NSString* const MODAL_MESSAGE = @"This is a modal view";
static NSString* const MODAL_CONFIRM_BUTTON_TITLE = @"OK";
static NSString* const ALERT_CANCEL_BUTTON = @"OK";

/**
 *  A modal type notification
 */
@implementation ModalViewController
#pragma mark - Controller Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

/**
 *  Sets up the modal view
 */
-(void)setUpView{
    self.view.backgroundColor = [UIColor flatLightBlue];
    _modalMessage = [[UILabel alloc] initWithFrame:CGRectMake(0, [self getTopPositionRounded] + [self getLargeHeightPadding], 0, 0)];
    [_modalMessage setText:MODAL_MESSAGE];
    _modalMessage.font = [UIFont mediumFont];
    [_modalMessage sizeToFit];
    [self centerViewByWidth:_modalMessage];

    CGSize buttonSize = [self getSmallSquareSize];
    
    _confirmButton = [[UIButton alloc ] initWithFrame:[self frameFromCGPoint:CGPointZero AndCGSize:buttonSize]];
    [self centerViewByWidth:_confirmButton];
    [self putView:_confirmButton belowView:_modalMessage withPadding:[self getSmallHeightPadding]];
    
    [_confirmButton setTitle:MODAL_CONFIRM_BUTTON_TITLE forState:UIControlStateNormal];
    _confirmButton.backgroundColor = [UIColor flatOffWhite];
    [_confirmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_confirmButton addTarget:self action:@selector(modalButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    _confirmButton.titleLabel.font = [UIFont mediumFont];
    
    [self.view addSubview:_modalMessage];
    [self.view addSubview:_confirmButton];
}

#pragma mark - Button Events
/**
 *  Dismisses modal
 *
 *  @param sender the modal button
 */
-(void)modalButtonPressed:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
