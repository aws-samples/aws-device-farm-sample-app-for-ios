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


#import "ThirdViewController.h"
#import "FourthViewController.h"

static NSString* const NEXT_VIEW_TITLE = @"View 4";
static NSString* const NEXT_VIEW_MESSAGE = @"This is the fourth view";

@implementation ThirdViewController

/**
 *  Goes to the 4th view controller
 */
-(void)goNext{
    FourthViewController *fourthVC = [[FourthViewController alloc] initWithTitle:NEXT_VIEW_TITLE andImage:nil andText:NEXT_VIEW_MESSAGE andIsLast:YES];
    [self.navigationController pushViewController:fourthVC animated:YES];
}

@end
