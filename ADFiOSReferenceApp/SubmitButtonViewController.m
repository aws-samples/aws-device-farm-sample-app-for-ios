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


#import "SubmitButtonViewController.h"

@interface SubmitButtonViewController ()
@property UIButton *submitButton;
@end
static NSString * const SUBMIT_BUTTON_TEXT = @"Submit";

/**
 *  The submit button (changes the buttons color when pressed)
 */
@implementation SubmitButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _submitButton.frame = [self frameFromCGPoint:CGPointZero AndCGSize:[self getLargeSquareSize]];
    [_submitButton setTitle:SUBMIT_BUTTON_TEXT forState:UIControlStateNormal];
    _submitButton.titleLabel.font = [UIFont largeFont];
    [_submitButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    _submitButton.backgroundColor = [UIColor flatGreen];
    [_submitButton addTarget:self action:@selector(submitButtonPressed:) forControlEvents:UIControlEventTouchDown];
    [_submitButton addTarget:self action:@selector(submitButtonReleased:) forControlEvents:UIControlEventTouchUpInside];
    [self centerView:_submitButton];
    [self.view addSubview:_submitButton];
}

/**
 *  Changes the button color when pressed
 *
 *  @param sender the button
 */
-(void)submitButtonPressed:(UIButton*)sender{
    _submitButton.backgroundColor = [UIColor flatDarkRed];
}

/**
 *  Changes the button's color to origional when released
 *
 *  @param sender the button
 */
-(void)submitButtonReleased:(UIButton*)sender{
    _submitButton.backgroundColor = [UIColor flatGreen];
}

@end
