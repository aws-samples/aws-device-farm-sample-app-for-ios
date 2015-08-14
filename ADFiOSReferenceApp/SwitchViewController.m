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


#import "SwitchViewController.h"

@interface SwitchViewController ()
@property UISwitch *switchControl;
@end

/**
 *  A controller for a switch control
 */
@implementation SwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

-(void)setUpView{
    self.view.backgroundColor = [UIColor flatWetAsphalt];
    _switchControl = [[UISwitch alloc] initWithFrame:CGRectZero];
    [_switchControl sizeToFit];
    [self centerView:_switchControl];
    [_switchControl addTarget:self action:@selector(switchFlipped:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_switchControl];
}

/**
 *  A switch action (changes the view's background color)
 *
 *  @param controller the switch
 */
-(void)switchFlipped:(UISwitch*)controller{
    if ([controller isOn]) {
        self.view.backgroundColor = [UIColor flatYellow];
        return;
    }
    
    self.view.backgroundColor = [UIColor flatWetAsphalt];
}
@end
