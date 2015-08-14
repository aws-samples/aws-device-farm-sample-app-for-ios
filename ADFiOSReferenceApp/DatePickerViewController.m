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


#import "DatePickerViewController.h"

@interface DatePickerViewController ()
@property UILabel *dateDisplayLabel;
@property UIDatePicker *datePicker;
@end
static NSString* const DEFAULT_DATE_LABEL_TEXT = @"Please select a date from the date picker";
static NSString* const DATE_LABEL_FORMAT = @"%@";

/**
 *  A date picker controller
 */
@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

-(void)setUpView{
    _dateDisplayLabel = [[UILabel alloc] initWithFrame:
                         CGRectMake(0, [self getTopPositionRounded] + [self getSmallHeightPadding], [self getWidthMinusSmallPadding], 0)];
    [_dateDisplayLabel setText:DEFAULT_DATE_LABEL_TEXT];
    _dateDisplayLabel.numberOfLines = 0;
    [_dateDisplayLabel sizeToFit];
    [self centerViewByWidth:_dateDisplayLabel];
    [self.view addSubview:_dateDisplayLabel];
    
    _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
    [_datePicker sizeToFit];
    [self centerViewByWidth:_datePicker];
    [self putView:_datePicker belowView:_dateDisplayLabel withPadding:[self getSmallHeightPadding]];
    [self centerViewByWidth:_datePicker];
    
    //Sets the datepicker mode, date, and adds a action
    _datePicker.datePickerMode = UIDatePickerModeDate;
    _datePicker.date = [NSDate date];
    [_datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_datePicker];
}

/**
 *  A action when the date picker is changed
 *
 *  @param sender the datepicker
 */
-(void)dateChange:(id)sender{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    _dateDisplayLabel.text = [NSString stringWithFormat:DATE_LABEL_FORMAT, [df stringFromDate:_datePicker.date]];
    [_dateDisplayLabel sizeToFit];
    [self centerViewByWidth:_dateDisplayLabel];
}

@end
