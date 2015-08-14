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

#import "ADFBaseViewController.h"

static const NSUInteger SMALL_WIDTH_PADDING_RATIO = 20;
static const NSUInteger LARGE_WIDTH_PADDING_RATIO = 10;
static const NSUInteger MICRO_HEIGHT_PADDING_RATIO = 48;
static const NSUInteger SMALL_HEIGHT_PADDING_RATIO = 16;
static const NSUInteger LARGE_HEIGHT_PADDING_RATIO = 10;


static const NSUInteger DEFAULT_BASE_SIZE = 44;
static const CGFloat DEFAULT_UITEXTFIELD_HEIGHT = 40;

/**
 *  A base controller for the view controllers within the app. 
 *
 * Contains app specific defaults and convienience methods
 */
@implementation ADFBaseViewController

#pragma mark - UIViewController SetUp
-(void)viewDidLoad{
    //set default background color
    self.view.backgroundColor = [UIColor flatOffWhite];
}

/**
 *  A constructor method that initializes the tab bar title and image
 *
 *  @param title the tabbar title
 *  @param image the tabbar image
 *
 *  @return the instance
 */
-(id)initWithTitle:(NSString*)title andImage:(UIImage*)image{
    self = [super init];
    if (self) {
        self.tabBarItem.title = title;
        self.tabBarItem.image = image;
        self.navigationController.navigationBar.autoresizesSubviews = NO;
    }
    return self;
}

#pragma mark - Convenience Methods

/**
 *  A convenience method that removes the tabbar height from the frame. 
 *
 * Used to ensure that nothing overlaps with the tabbar
 *
 *  @param view the view with the tabbar height removed
 */
-(void)subtractTabBarHeightFromFrame:(UIView*)view{
    CGFloat tabbarHeight = self.tabBarController.tabBar.frame.size.height;
    CGSize newFrameSize = CGSizeMake(view.frame.size.width, view.frame.size.height - tabbarHeight);
    view.frame = [self frameFromCGPoint:view.frame.origin AndCGSize:newFrameSize];
}

/**
 *  Positions the view by centering horizontally
 *
 *  @param givenView the view to position
 */
-(void)centerViewByWidth:(UIView*)givenView{
    CGPoint givenPoint = CGPointMake(self.view.bounds.size.width / 2 - givenView.frame.size.width / 2, givenView.frame.origin.y);
    givenView.frame = [self frameFromCGPoint:givenPoint AndCGSize:givenView.frame.size];
}

/**
 *  Positions the view by centering vertially
 *
 *  @param givenView the view to position
 */
-(void)centerViewByHeight:(UIView*)givenView{
    CGPoint centerHeight = CGPointMake(givenView.frame.origin.x, self.view.frame.size.height / 2 - givenView.frame.size.height / 2);
    givenView.frame = [self frameFromCGPoint:centerHeight AndCGSize:givenView.frame.size];
}

/**
 *  Centers a view horizontally and vertically within the view
 *
 *  @param givenView the view to position
 */
-(void)centerView:(UIView*)givenView{
    [self centerViewByWidth:givenView];
    [self centerViewByHeight:givenView];
}

/**
 *  Positions a view by stacking it below another view with a specific padding between
 *
 *  @param bottom  the button view
 *  @param topView the top view
 *  @param padding the padding between
 */
-(void)putView:(UIView*)bottom belowView:(UIView*)topView withPadding:(CGFloat)padding{
    CGPoint bottomPoint = CGPointMake(bottom.frame.origin.x, topView.frame.origin.y + topView.frame.size.height + padding);
    bottom.frame = [self frameFromCGPoint:bottomPoint AndCGSize:bottom.frame.size];
}

/**
 *  A convienience method so that the frame can be created with a point and size instead of CGRectMake
 *
 *  @param point     the point of the frame
 *  @param frameSize the size of the frame
 *
 *  @return <#return value description#>
 */
-(CGRect)frameFromCGPoint:(CGPoint)point AndCGSize:(CGSize)frameSize{
    return CGRectMake(point.x, point.y, frameSize.width, frameSize.height);
}

/**
 *  Fills the screen with the view. Places under status bar and over tabbar
 *
 *  @param givenView the view to fill the screen with
 */
-(void)fillScreenWithView:(UIView*)givenView{
    NSLog(@"fill screen");
    if ([self getNavigationBarHeight] > 0) {
        NSLog(@"nav bar");
        givenView.frame = self.view.frame;
        return;
    }

    CGFloat difference = [self getStatusBarHeight] + [self getTabBarHeight];
    CGSize newSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - difference);
    
    givenView.frame = [self frameFromCGPoint:CGPointZero AndCGSize:newSize];
    
    [self putViewBelowStatusBar:givenView];
}

/**
 *  Puts a view below the status bar
 *
 *  @param givenView the view to put below the status bar
 */
-(void)putViewBelowStatusBar:(UIView*)givenView {
    CGPoint newPoint = CGPointMake(0, [self getStatusBarHeight]);
    givenView.frame = [self frameFromCGPoint:newPoint AndCGSize:givenView.frame.size];
}

/**
 *  Gets the height of the status bar
 *
 *  @return status bar height
 */
-(CGFloat)getStatusBarHeight {
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}

/**
 *  Gets the navigationbar height
 *
 *  @return navigation bar height
 */
-(CGFloat)getNavigationBarHeight {
    return self.navigationController.navigationBar.frame.size.height;
}

/**
 *  Gets the tabbar height
 *
 *  @return tab bar height
 */
-(CGFloat)getTabBarHeight {
    return self.tabBarController.tabBar.frame.size.height;
}

/**
 *  Returns the small width padding
 *
 *  @return the small width padding
 */
-(CGFloat)getSmallWidthPadding {
    return self.view.frame.size.width / SMALL_WIDTH_PADDING_RATIO;
}

/**
 *  Returns the large width padding
 *
 *  @return the large width padding
 */
-(CGFloat)getLargeWidthPadding {
    return self.view.frame.size.width / LARGE_WIDTH_PADDING_RATIO;
}

/**
 *  Returns the total width minus the small padding
 *
 *  @return total width minus small padding
 */
-(CGFloat)getWidthMinusSmallPadding {
    return self.view.frame.size.width - [self getSmallWidthPadding];
}

/**
 *  Returns the total width minus large padding
 *
 *  @return total width minus large padding
 */
-(CGFloat)getWidthMinusLargePadding {
    return self.view.frame.size.width - [self getLargeWidthPadding];
}

/**
 *  Returns the smallest height padding
 *
 *  @return smallest height padding
 */
-(CGFloat)getMicroHeightPadding {
    return self.view.frame.size.height / MICRO_HEIGHT_PADDING_RATIO;
}

/**
 *  gets the small height padding
 *
 *  @return small height padding
 */
-(CGFloat)getSmallHeightPadding {
    return self.view.frame.size.height / SMALL_HEIGHT_PADDING_RATIO;
}

/**
 *  gets the large height padding
 *
 *  @return large height padding
 */
-(CGFloat)getLargeHeightPadding {
    return self.view.frame.size.height / LARGE_HEIGHT_PADDING_RATIO;
}

/**
 *  Calculates a small square size
 *
 *  @return small square size
 */
-(CGSize)getSmallSquareSize{
    return [self makeSquareSize:DEFAULT_BASE_SIZE + [self getLargeWidthPadding]];
}

/**
 *  Calculates a large square size
 *
 *  @return large square size
 */
-(CGSize)getLargeSquareSize {
    return [self makeSquareSize:DEFAULT_BASE_SIZE + ([self getLargeWidthPadding] * 2)];
}

/**
 *  Creates a square size
 *
 *  @param the size of one side of the square
 *
 *  @return the square size
 */
-(CGSize)makeSquareSize:(CGFloat)size{
    return CGSizeMake(size, size);
}

/**
 *  Gets the default text height
 *
 *  @return default text height
 */
-(CGFloat)getDefaultTextfieldHeight {
    return DEFAULT_UITEXTFIELD_HEIGHT;
}

/**
 *  Gets the top position (under the status and navigation bars)
 *
 *  @return top position
 */
-(CGFloat)getTopPosition {
    return [self getStatusBarHeight] + [self getNavigationBarHeight];
}

/**
 *  Gets the top rounded position
 *
 *  @return top rounded position
 */
-(CGFloat)getTopPositionRounded {
    CGFloat position = [self getTopPosition];
    NSLog(@"%f" , (ceilf(position / 10) * 10));
    return ceilf(position / 10) * 10;
}

/**
 *  Calculates a size based on a 16:9 movie ratio
 *
 *  @return size for video frame
 */
-(CGSize)calculateMovieAspectRatioSize {
    CGFloat const sixteenByNine = 1.777777778;
    CGFloat height = self.view.frame.size.width / sixteenByNine;
    return CGSizeMake(self.view.frame.size.width, height);
}

/**
 *  Puts a view at the bottom
 *
 *  @param givenView the view to position
 *  @param padding   the padding below
 */
-(void)putViewAtBottom:(UIView*)givenView withPadding:(CGFloat)padding{
    CGPoint newPoint = CGPointMake(0, self.view.bounds.size.height - self.tabBarController.tabBar.frame.size.height - givenView.frame.size.height - padding);
    givenView.frame = [self frameFromCGPoint:newPoint AndCGSize:givenView.frame.size];
}

@end
