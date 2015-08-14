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



#import "DataPickerViewController.h"

@interface DataPickerViewController ()
@property UILabel *pickerDisplay;
@property NSArray *pickerData;
@property UIPickerView *picker;
@end

static NSString * const PICKER_DEFAULT_DISPLAY = @"Submit";
static NSInteger const PICKER_COMPONENT_NUMBER = 1;

/**
 *  The data picker controller
 */
@implementation DataPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pickerDisplay = [[UILabel alloc] initWithFrame:
                      CGRectMake(0, [self getTopPositionRounded] + [self getSmallWidthPadding], [self getWidthMinusSmallPadding], 0)];
    _pickerData = [[NSArray alloc] initWithObjects:@"Selection 1",@"Selection 2",@"Selection 3",@"Selection 4",@"Selection 5", nil];
    _pickerDisplay.text = PICKER_DEFAULT_DISPLAY;
    _pickerDisplay.font = [UIFont largeFont];
    [_pickerDisplay sizeToFit];
    _pickerDisplay.textAlignment = NSTextAlignmentCenter;
    [self centerViewByWidth:_pickerDisplay];
    
    _picker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    [_picker sizeToFit];
    [self putView:_picker belowView:_pickerDisplay withPadding:self.view.frame.size.height/20];
    _picker.dataSource = self;
    _picker.delegate = self;
    [self.view addSubview:_picker];
    [self.view addSubview:_pickerDisplay];
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return PICKER_COMPONENT_NUMBER;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return (NSInteger)_pickerData.count;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_pickerData objectAtIndex:row];
}

/**
 *  Event when the data picker row is selected
 *
 *  Sets the display to the row's text
 *
 *  @param pickerView the picker view
 *  @param row        the row selected
 *  @param component  the component
 */
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _pickerDisplay.text = [_pickerData objectAtIndex:row];
    [_pickerDisplay sizeToFit];
    [self centerViewByWidth:_pickerDisplay];
}
@end
