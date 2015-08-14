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


#import "ContactAddButtonViewController.h"

@interface ContactAddButtonViewController ()
@property UIButton *contactAddButton;
@end

/**
 *  A add contact controller
 */
@implementation ContactAddButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

-(void)setUpView{
    _contactAddButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    _contactAddButton.frame = CGRectZero;
    [_contactAddButton sizeToFit];
    [_contactAddButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self centerView:_contactAddButton];
    [self.view addSubview:_contactAddButton];
}

-(void)buttonPressed:(UIButton*)sender{
    CGRect oldFrame = _contactAddButton.frame;
    [_contactAddButton removeFromSuperview];
    if (sender.buttonType == UIButtonTypeContactAdd) {
        _contactAddButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    } else {
        _contactAddButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    }
    _contactAddButton.frame = oldFrame;
    [_contactAddButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_contactAddButton];
}

@end
