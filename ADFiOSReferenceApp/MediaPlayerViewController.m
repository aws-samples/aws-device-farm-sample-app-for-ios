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


#import <MediaPlayer/MediaPlayer.h>
#import "MediaPlayerViewController.h"

@interface MediaPlayerViewController ()
@property MPMoviePlayerViewController *movieController;
@end
static NSString* const MOVIE_FILE_NAME = @"movie";
static NSString* const MOVIE_FILE_TYPE = @"mp4";

/**
 *  A video playing view controller
 */
@implementation MediaPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self playVideo];
}

/**
 *  Creates media player and initializes the movie
 */
-(void)setUpView{
    NSString *path = [[NSBundle mainBundle] pathForResource:MOVIE_FILE_NAME ofType:MOVIE_FILE_TYPE];
    NSURL *url = [NSURL fileURLWithPath:path];
    _movieController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    _movieController.moviePlayer.controlStyle = MPMovieControlStyleNone;
    _movieController.moviePlayer.repeatMode = MPMovieRepeatModeOne;
    _movieController.moviePlayer.scalingMode = MPMovieScalingModeFill;
    _movieController.view.frame = [self frameFromCGPoint:CGPointZero AndCGSize:[self calculateMovieAspectRatioSize]];
    [self centerView:_movieController.view];
    [self.view addSubview:_movieController.view];
}

/**
 *  plays the video
 */
-(void)playVideo{
    [_movieController.moviePlayer prepareToPlay];
    [_movieController.moviePlayer play];
}

@end
