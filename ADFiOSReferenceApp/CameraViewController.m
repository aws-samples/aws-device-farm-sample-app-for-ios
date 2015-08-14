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


#import "CameraViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface CameraViewController ()
@property AVCaptureSession *session;
@end

/**
 *  A camera view controller
 */
@implementation CameraViewController

/**
 *  Creates the camera preview
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    _session = [[AVCaptureSession alloc] init];
    _session.sessionPreset = AVCaptureSessionPresetPhoto;
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error;
    
    AVCaptureDeviceInput *deviceInput = [[AVCaptureDeviceInput alloc] initWithDevice:device error:&error];
    
    if ([_session canAddInput:deviceInput]) {
        [_session addInput:deviceInput];
    }
    
    AVCaptureVideoPreviewLayer *previewLayer =  [[AVCaptureVideoPreviewLayer alloc] initWithSession:_session];
    
    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    CALayer *rootLayer = self.view.layer;
    rootLayer.masksToBounds = YES;
    previewLayer.frame = [self frameFromCGPoint:CGPointMake(0, [self getLargeHeightPadding] + [self getTopPositionRounded]) AndCGSize:[self calculateMovieAspectRatioSize]];
    
    [rootLayer insertSublayer:previewLayer atIndex:0];
    [_session startRunning];
}

@end
