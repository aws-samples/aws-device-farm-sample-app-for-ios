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


#import "UIColor+ColorExtension.h"

/**
 *  A convience class that returns app specific colours
 */
@implementation UIColor (ColorExtension)
+ (UIColor*)flatOrange {
    return [UIColor colorWithRed:255/255.0f green:153/255.0f blue:0/255.0f alpha:1.0f];
}

+ (UIColor*)flatYellow {
    return [UIColor colorWithRed:241/255.0f green:196/255.0f blue:15/255.0f alpha:1.0f];
}

+ (UIColor*)flatGray {
    return [UIColor colorWithRed:99/255.0f green:102/255.0f blue:106/255.0f alpha:1.0f];
}

+ (UIColor*)flatLightGray {
    return [UIColor colorWithRed:149/255.0f green:165/255.0f blue:166/255.0f alpha:1.0f];
}

+ (UIColor*)flatDarkGray {
    return [UIColor colorWithRed:127/255.0f green:140/255.0f blue:141/255.0f alpha:1.0f];
}

+ (UIColor*)flatOffWhite {
    return [UIColor colorWithRed:236/255.0f green:240/255.0f blue:241/255.0f alpha:1.0f];
}

+ (UIColor*)flatDarkOffWhite {
    return [UIColor colorWithRed:189/255.0f green:195/255.0f blue:199/255.0f alpha:1.0f];
}

+ (UIColor*)flatLightBlue {
    return [UIColor colorWithRed:52/255.0f green:152/255.0f blue:219/255.0f alpha:1.0f];
}

+ (UIColor*)flatDarkBlue {
    return [UIColor colorWithRed:41/255.0f green:128/255.0f blue:185/255.0f alpha:1.0f];
}

+ (UIColor*)flatGreen {
    return [UIColor colorWithRed:46/255.0f green:204/255.0f blue:113/255.0f alpha:1.0f];
}

+ (UIColor*)flatLightRed {
    return [UIColor colorWithRed:231/255.0f green:76/255.0f blue:60/255.0f alpha:1.0f];
}

+ (UIColor*)flatDarkRed {
    return [UIColor colorWithRed:192/255.0f green:57/255.0f blue:43/255.0f alpha:1.0f];
}

+ (UIColor*)flatSilver {
    return [UIColor colorWithRed:218/255.0f green:216/255.0f blue:214/255.0f alpha:1.0f];
}

+ (UIColor*)flatMidnightBlue {
    return [UIColor colorWithRed:44/255.0f green:62/255.0f blue:80/255.0f alpha:1.0f];
}
+ (UIColor*)flatWetAsphalt {
    return [UIColor colorWithRed:52/255.0f green:73/255.0f blue:94/255.0f alpha:1.0f];
}

@end
