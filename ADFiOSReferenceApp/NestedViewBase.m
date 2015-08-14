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


#import "NestedViewBase.h"
@interface NestedViewBase ()
@property UILabel *textLabel;
@property NSString *text;
@property NSString *pageTitle;
@end

/**
 *  The nested view base controller
 */
@implementation NestedViewBase
static NSString* const NEXT_BUTTON_TEXT = @"Next";

#pragma mark - Controller Methods
-(id)initWithTitle:(NSString *)title andImage:(UIImage *)image andText:(NSString*)text andIsLast:(BOOL)last{
    self = [super initWithTitle:title andImage:image];
    if (self) {
        _text = text;
        if (!last) {
            UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:NEXT_BUTTON_TEXT style:UIBarButtonItemStyleBordered target:self action:@selector(goNext)];
            self.navigationItem.rightBarButtonItem = nextButton;
        }
    }
    return self;
}

-(id)initWithTitle:(NSString *)title andImage:(UIImage *)image{
    self = [super init];
    if (self) {
        _pageTitle = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

-(void)setUpView{
    self.navigationItem.title = _pageTitle;
    _textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _textLabel.text = _text;
    _textLabel.font = [UIFont defaultFontAtSize:27];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    [_textLabel sizeToFit];
    [self centerViewByHeight:_textLabel];
    [self centerViewByWidth:_textLabel];
    [self.view addSubview:_textLabel];
}

/**
 *  Goes to the next controller
 */
-(void)goNext{
}
@end
