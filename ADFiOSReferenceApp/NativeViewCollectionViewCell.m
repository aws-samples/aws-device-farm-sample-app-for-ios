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


#import "NativeViewCollectionViewCell.h"
#import "UIColor+ColorExtension.h"
#import "UIFont+FontExtension.h"

/**
 The cell for the native navigation 
 */
@implementation NativeViewCollectionViewCell
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.cellTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.cellTitle.textColor = [UIColor whiteColor];
        self.cellTitle.backgroundColor = [UIColor flatDarkBlue];
        self.cellTitle.textAlignment = NSTextAlignmentCenter;
        self.cellTitle.font = [UIFont mediumFont];
        self.cellTitle.numberOfLines = 0;
        
        [self.contentView addSubview:self.cellTitle];
    }
    
    return self;
}
@end
