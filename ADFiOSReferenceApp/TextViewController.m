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


#import "TextViewController.h"

@interface TextViewController ()
@property UITextView *textView;
@end
static NSString* const TEXTVIEW_DEFAULT_TEXT = @"I am a textview";

/**
 *  A text input controller
 */
@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

-(void)setUpView{
    _textView = [[UITextView alloc] initWithFrame:
                 CGRectMake(0, [self getTopPositionRounded] + [self getSmallHeightPadding], [self getWidthMinusSmallPadding], self.view.bounds.size.height / 3)];
    [_textView setText:TEXTVIEW_DEFAULT_TEXT];
    [self centerViewByWidth:_textView];
    [self.view addSubview:_textView];
}

@end
