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



#import "InputControlsPageViewController.h"
#import "InputBaseControlViewController.h"
#import "TextViewController.h"
#import "ContactAddButtonViewController.h"
#import "DatePickerViewController.h"
#import "LabelsViewController.h"
#import "RefreshControlViewController.h"
#import "SwitchViewController.h"
#import "InputTextFieldViewController.h"
#import "SubmitButtonViewController.h"
#import "DataPickerViewController.h"
#import "GesturesViewController.h"

@interface InputControlsPageViewController ()
@property UIPageViewController *pageControl;
@end

static NSUInteger const NUMBER_OF_PAGES = 10;
static NSUInteger const STARTING_PAGE_INDEX = 0;
@implementation InputControlsPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

-(void)setUpView{
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.dataSource = self;
    self.pageController.view.backgroundColor = [UIColor blackColor];
    [[self.pageController view] setFrame:CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height - self.tabBarController.tabBar.frame.size.height)];
    
    InputBaseControlViewController *initialViewController = [self viewControllerAtIndex:STARTING_PAGE_INDEX];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
}

/**
 *  Loads the controllers for each page
 *
 *  @param index the current index
 *
 *  @return the new page's viewcontroller
 */
- (InputBaseControlViewController *)viewControllerAtIndex:(NSUInteger)index {
    InputBaseControlViewController *childViewController;
    switch (index) {
        case 0:
            childViewController = [[TextViewController alloc] init];
            break;
        case 1:
            childViewController = [[ContactAddButtonViewController alloc] init];
            break;
        case 2:
            childViewController = [[DatePickerViewController alloc] init];
            break;
        case 3:
            childViewController = [[LabelsViewController alloc] init];
            break;
        case 4:
            childViewController = [[RefreshControlViewController alloc] init];
            break;
        case 5:
            childViewController = [[SwitchViewController alloc] init];
            break;
        case 6:
            childViewController = [[InputTextFieldViewController alloc] init];
            break;
        case 7:
            childViewController = [[SubmitButtonViewController alloc] init];
            break;
        case 8:
            childViewController = [[DataPickerViewController alloc] init];
            break; 
        case 9:
            childViewController = [[GesturesViewController alloc] init];
            break;
        default:
            break;
    }
    
    childViewController.pageIndex = index;
    return childViewController;
    
}

/**
 *  Reduces index when page is swiped to the right and returns the previous view controller
 *
 *  @param pageViewController the page view controller
 *  @param viewController     the before view controller
 *
 *  @return <#return value description#>
 */
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(InputBaseControlViewController *)viewController pageIndex];
    
    //You can never go past the first page
    if (index == 0) {
        return nil;
    }
    
    // Decrease the index by 1 to return
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

/**
 *  Increases index when page is swiped to the left and returns the next view controller
 *
 *  @param pageViewController <#pageViewController description#>
 *  @param viewController     <#viewController description#>
 *
 *  @return <#return value description#>
 */
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(InputBaseControlViewController *)viewController pageIndex];
    
    index++;
    
    //You can never go past the last page
    if (index == (NUMBER_OF_PAGES + 1)) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return NUMBER_OF_PAGES;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return STARTING_PAGE_INDEX;
}

@end
