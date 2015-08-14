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


#import "NotificationsViewController.h"
#import "PopOverViewController.h"
#import "ModalViewController.h"

/**
 *  View notification controller
 */
@interface NotificationsViewController ()
@property UIButton *popOverButton;
@property UIButton *alertButton;
@property UIButton *modalButton;
@end
static NSString* const POP_OVER_BUTTON_TITLE = @"Pop-Over";
static NSString* const ALERT_BUTTON_TITLE = @"Alert";
static NSString* const MODAL_BUTTON_TITLE = @"Modal";

static NSString* const ALERT_TITLE = @"Alert";
static NSString* const ALERT_CONTENT = @"This is an alert";
static NSString* const ALERT_CANCEL_BUTTON = @"OK";

@implementation NotificationsViewController

#pragma mark - Controller Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

/**
 *  Creates and configures view
 */
-(void)setUpView{
    CGSize buttonSize = [self getSmallSquareSize];
    CGFloat gapBetweenButtons = [self getSmallHeightPadding];
    CGPoint firstButtonPoint = CGPointMake(0, [self getTopPositionRounded] + [self getLargeHeightPadding]);
    //initialize
    _modalButton = [[UIButton alloc] initWithFrame:[self frameFromCGPoint:firstButtonPoint AndCGSize:buttonSize]];
    _alertButton = [[UIButton alloc] initWithFrame:[self frameFromCGPoint:CGPointZero AndCGSize:buttonSize]];
    _popOverButton = [[UIButton alloc] initWithFrame:[self frameFromCGPoint:CGPointZero AndCGSize:buttonSize]];
    
    //position buttons
    [self centerViewByWidth:_modalButton];
    [self centerViewByWidth:_alertButton];
    [self centerViewByWidth:_popOverButton];
    
    [self putView:_alertButton belowView:_modalButton withPadding:gapBetweenButtons];
    [self putView:_popOverButton belowView:_alertButton withPadding:gapBetweenButtons];
    
    [self configureButton:_modalButton withEvent:@selector(modalButtonPressed:) andTitle:MODAL_BUTTON_TITLE];
    [self configureButton:_alertButton withEvent:@selector(alertButtonPressed:) andTitle:ALERT_BUTTON_TITLE];
    [self configureButton:_popOverButton withEvent:@selector(popOverButtonPressed:) andTitle:POP_OVER_BUTTON_TITLE];
    
    [self.view addSubview:_alertButton];
    [self.view addSubview:_modalButton];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [self.view addSubview:_popOverButton];
    }
}

#pragma mark - Button Configuration
/**
 *  Configures button
 *
 *  @param button the button
 *  @param event  buttons action
 *  @param title  button title
 */
-(void)configureButton:(UIButton*)button withEvent:(SEL)event andTitle:(NSString*)title{
    button.backgroundColor = [UIColor flatDarkBlue];
    button.titleLabel.font = [UIFont mediumFont];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:event forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Button Events
/**
 *  Creates a popover
 *
 *  @param sender popover button
 */
-(void)popOverButtonPressed:(UIButton*)sender{
    PopOverViewController *content = [[PopOverViewController alloc] init];
    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:content];
    [popover setPopoverContentSize:[self getLargeSquareSize] animated:YES];
    [popover presentPopoverFromRect:sender.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

/**
 *  Creates alert
 *
 *  @param sender alert button
 */
-(void)alertButtonPressed:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:ALERT_TITLE message:ALERT_CONTENT delegate:nil cancelButtonTitle:ALERT_CANCEL_BUTTON otherButtonTitles:nil];
    [alert show];
}

/**
 *  Creates modal
 *
 *  @param sender modal button
 */
-(void)modalButtonPressed:(id)sender{
    ModalViewController *modal = [[ModalViewController alloc] init];
    [self presentViewController:modal animated:YES completion:nil];
}
@end
