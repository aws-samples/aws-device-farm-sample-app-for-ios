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


#import "LabelsViewController.h"

@interface LabelsViewController ()
@property UILabel *label1;
@property UILabel *label2;
@end

static NSString* const LABEL1_TEXT = @"I am label 1";
static NSString* const LABEL2_TEXT = @"I am label 2";

/**
 *  A controller for labels
 */
@implementation LabelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

-(void)setUpView{
    _label1 = [[UILabel alloc] initWithFrame:
               CGRectMake(0, [self getTopPositionRounded] + [self getLargeHeightPadding], [self getWidthMinusSmallPadding], 0)];
    _label2 = [[UILabel alloc] initWithFrame:
               CGRectMake(0, 0, [self getWidthMinusSmallPadding], 0)];
    
    [self configureLabels:_label1 WithText:LABEL1_TEXT];
    [self configureLabels:_label2 WithText:LABEL2_TEXT];
    
    [self putView:_label2 belowView:_label1 withPadding:[self getSmallHeightPadding]];
    [self.view addSubview:_label1];
    [self.view addSubview:_label2];
}

/**
 *  Configures the labels
 *
 *  @param label label
 *  @param text  text
 */
-(void)configureLabels:(UILabel*)label WithText:(NSString*)text{
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont largeFont];
    [label sizeToFit];
    [self centerViewByWidth:label];
}

@end
