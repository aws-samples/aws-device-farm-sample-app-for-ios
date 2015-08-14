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


#import "SecondViewController.h"
#import "ThirdViewController.h"

static NSString* const NEXT_VIEW_TITLE = @"View 3";
static NSString* const NEXT_VIEW_MESSAGE = @"This is the third view";

@implementation SecondViewController

/**
 *  Goes to the 3rd view controller
 */
-(void)goNext{
    ThirdViewController *thirdVC = [[ThirdViewController alloc] initWithTitle:NEXT_VIEW_TITLE andImage:nil andText:NEXT_VIEW_MESSAGE andIsLast:NO];
    [self.navigationController pushViewController:thirdVC animated:YES];
}

@end
