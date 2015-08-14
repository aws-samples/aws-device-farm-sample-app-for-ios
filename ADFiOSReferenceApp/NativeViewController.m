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

#import "NativeViewController.h"
#import "NativeViewCollectionViewCell.h"
#import "ImageGalleryViewController.h"
#import "ScrollingViewController.h"
#import "ElementsTableViewController.h"
#import "MediaPlayerViewController.h"
#import "CameraViewController.h"
#import "ScrollOutOfViewViewController.h"
#import "UIColor+ColorExtension.h"

@interface NativeViewController ()
@property UICollectionView *collectionView;
@property NSArray *choiceNames;
@end

static NSString* const NAVIGATION_TITLE = @"Menu";
static NSString* const CELL_IDENTIFIER = @"cellIdentifier";
static NSUInteger const CELL_SIZE = 100;

/**
 *  Main view controller for the native view
 *
 *  Creates the navigation across all of the different native view controllers
 *
 */
@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

-(void)setUpView{
    self.navigationItem.title = NAVIGATION_TITLE;
    
    _choiceNames = [NSArray arrayWithObjects:@"Image Gallery",@"Scrolling View",@"Table of elements",@"Video Player",@"Camera",@"Out of View Component", nil];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self fillScreenWithView:_collectionView];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    [_collectionView registerClass:[NativeViewCollectionViewCell class] forCellWithReuseIdentifier:CELL_IDENTIFIER];
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_choiceNames count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NativeViewCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    
    cell.cellTitle.text = [_choiceNames objectAtIndex:indexPath.item];
    
    return cell;
}

-(UIViewController*)getSelectedViewController:(NSInteger)index{
    UIViewController *selectedVC;
    switch (index) {
        case 0:
            selectedVC = [[ImageGalleryViewController alloc] init];
            break;
        case 1:
            selectedVC = [[ScrollingViewController alloc] init];
            break;
        case 2:
            selectedVC = [[ElementsTableViewController alloc] init];
            break;
        case 3:
            selectedVC = [[MediaPlayerViewController alloc] init];
            break;
        case 4:
            selectedVC = [[CameraViewController alloc] init];
            break;
        case 5:
            selectedVC = [[ScrollOutOfViewViewController alloc] init];
        default:
            break;
    }
    return selectedVC;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath*)indexPath{
    UIViewController *controllerToBePushed = [self getSelectedViewController:indexPath.row];
    [self.navigationController pushViewController:controllerToBePushed animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return [self makeSquareSize:CELL_SIZE];
}

@end
