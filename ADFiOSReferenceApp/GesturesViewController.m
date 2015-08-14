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


#import "GesturesViewController.h"

@interface GesturesViewController ()
@property UIImage *image;
@property UIImageView *imageView;
@property UIPanGestureRecognizer *panRecognizer;
@property UIRotationGestureRecognizer *rotateRecognizer;
@property UIPinchGestureRecognizer *pinchRecognizer;
@end
static NSString* const IMAGE_NAME = @"solid";
static NSString* const IMAGE_TYPE = @"png";

/**
 *  A gesture controller using a image
 */
@implementation GesturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

-(void)setUpView{
    NSString *path = [[NSBundle mainBundle] pathForResource:IMAGE_NAME ofType:IMAGE_TYPE];
    _image = [[UIImage alloc] initWithContentsOfFile:path];
    _imageView = [[UIImageView alloc] initWithFrame:
                  [self frameFromCGPoint:CGPointZero AndCGSize:[self getLargeSquareSize]]];
    [self centerView:_imageView];
    _imageView.contentMode = UIViewContentModeScaleToFill;
    _imageView.image = _image;
    _imageView.userInteractionEnabled = YES;
    
    _panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    _panRecognizer.delegate = self;
    _pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    _pinchRecognizer.delegate = self;
    _rotateRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotateGesture:)];
    _rotateRecognizer.delegate = self;
    
    [_imageView addGestureRecognizer:_panRecognizer];
    [_imageView addGestureRecognizer:_pinchRecognizer];
    [_imageView addGestureRecognizer:_rotateRecognizer];

    [self centerViewByWidth:_imageView];
    [self.view addSubview:_imageView];
}

/**
 *  Action for the pan gesture. Moves the image based on touch.
 *
 *  @param recognizer gesture recognizer
 */
-(IBAction)handlePanGesture:(UIPanGestureRecognizer*)recognizer {
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slide = magnitude / 200;
        
        float slideFactor = 0.1 * slide;
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor),
                                         recognizer.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);
        
        [UIView animateWithDuration:slideFactor * 2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            recognizer.view.center = finalPoint;
        } completion:nil];
    }
}

/**
 *  Action for the pinch gesture. Scales the image based on touch.
 *
 *  @param recognizer the gesture regonizer.
 */
-(IBAction)handlePinchGesture:(UIPinchGestureRecognizer*)recognizer {
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

/**
 *  Action for the rotation gesture. Rotates the image based on touch
 *
 *  @param recognizer the gesture recognizer
 */
-(IBAction)handleRotateGesture:(UIRotationGestureRecognizer*)recognizer {
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
