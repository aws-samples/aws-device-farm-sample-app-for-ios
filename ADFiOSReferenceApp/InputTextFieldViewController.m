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


#import "InputTextFieldViewController.h"

@interface InputTextFieldViewController ()
@property UITextField *textField;
@end

static NSString* const TEXT_FIELD_PLACEHOLDER_TEXT = @"text field";

/**
 *  A controller for a input field
 */
@implementation InputTextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

-(void)setUpView{
    _textField = [[UITextField alloc] initWithFrame:
                  CGRectMake(0, [self getTopPositionRounded] + [self getSmallHeightPadding], [self getWidthMinusSmallPadding], [self getDefaultTextfieldHeight])];
    [self centerViewByWidth:_textField];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.placeholder = TEXT_FIELD_PLACEHOLDER_TEXT;
    [self.view addSubview:_textField];
}

@end
