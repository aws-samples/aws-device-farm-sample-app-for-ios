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

#import <UIKit/UIKit.h>
#import "UIColor+ColorExtension.h"
#import "UIFont+FontExtension.h"

/**
 *  A base controller for the view controllers within the app.
 *
 * Contains app specific defaults and convienience methods
 */
@interface ADFBaseViewController : UIViewController
-(id)initWithTitle:(NSString*)title andImage:(UIImage*)image;
-(void)subtractTabBarHeightFromFrame:(UIView*)view;
-(void)putView:(UIView*)bottom belowView:(UIView*)topView withPadding:(CGFloat)padding;
-(CGRect)frameFromCGPoint:(CGPoint)point AndCGSize:(CGSize)frameSize;
-(void)centerViewByWidth:(UIView*)givenView;
-(void)centerViewByHeight:(UIView*)givenView;
-(void)centerView:(UIView*)givenView;
-(void)fillScreenWithView:(UIView*)givenView;
-(void)putViewBelowStatusBar:(UIView*)givenView;
-(CGFloat)getStatusBarHeight;
-(CGFloat)getTabBarHeight;
-(CGFloat)getNavigationBarHeight;
-(CGFloat)getSmallWidthPadding;
-(CGFloat)getLargeWidthPadding;
-(CGFloat)getMicroHeightPadding;
-(CGFloat)getSmallHeightPadding;
-(CGFloat)getLargeHeightPadding;
-(CGFloat)getWidthMinusSmallPadding;
-(CGFloat)getWidthMinusLargePadding;
-(CGSize) getSmallSquareSize;
-(CGSize) getLargeSquareSize;
-(CGSize)makeSquareSize:(CGFloat)size;
-(CGFloat)getDefaultTextfieldHeight;
-(CGFloat)getTopPosition;
-(CGFloat)getTopPositionRounded;
-(CGSize)calculateMovieAspectRatioSize;
-(void)putViewAtBottom:(UIView*)givenView withPadding:(CGFloat)padding;
@end
