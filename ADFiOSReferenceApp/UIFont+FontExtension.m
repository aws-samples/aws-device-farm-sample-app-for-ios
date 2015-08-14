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


#import "UIFont+FontExtension.h"

/**
 *  A convenience class for a uniform font style/size within the app
 */
@implementation UIFont (FontExtension)
NSString *const DEFAULT_FONT_NAME = @"HelveticaNeue-Light";
NSString *const DEFAULT_BOLD_NAME = @"Helvetica";
CGFloat const SMALL_FONT_SIZE = 14;
CGFloat const MEDIUM_FONT_SIZE = 17;
CGFloat const LARGE_FONT_SIZE = 20;

/**
 *  Returns the default font at a specific size
 *
 *  @param size The size of the font
 *
 *  @return The font
 */
+ (UIFont*)defaultFontAtSize:(CGFloat)size {
    return [UIFont fontWithName:DEFAULT_FONT_NAME size:size];
}

/**
 *  Returns the default bold font at a specific size
 *
 *  @param size The size of the font
 *
 *  @return The bold font
 */
+ (UIFont*)defaultBoldFontAtSize:(CGFloat)size {
    return [UIFont fontWithName:DEFAULT_BOLD_NAME size:size];
}

/**
 *  Returns the default font at the default small size
 *
 *  @return Default small font
 */
+ (UIFont*)smallFont {
    return [self defaultFontAtSize:SMALL_FONT_SIZE];
}

/**
 *  Returns the default font at the default medium size
 *
 *  @return Default medium font
 */
+ (UIFont*)mediumFont {
    return [self defaultFontAtSize:MEDIUM_FONT_SIZE];
}

/**
 *  Returns the default font at the default large size
 *
 *  @return Default large font
 */
+ (UIFont*)largeFont {
    return [self defaultFontAtSize:LARGE_FONT_SIZE];
}

/**
 *  Returns the default bold font at the default small size
 *
 *  @return Default bold small font
 */
+ (UIFont*)smallBoldFont {
    return [self defaultBoldFontAtSize:SMALL_FONT_SIZE];
}

/**
 *  Returns the default bold font at the default medium size
 *
 *  @return Default bold medium font
 */
+ (UIFont*)mediumBoldFont {
    return [self defaultBoldFontAtSize:MEDIUM_FONT_SIZE];
}

/**
 *  Returns the default bold font at the default large size
 *
 *  @return Default bold large font
 */
+ (UIFont*)largeBoldFont {
    return [self defaultBoldFontAtSize:LARGE_FONT_SIZE];
}
@end
