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


#import "ScrollingViewController.h"

@interface ScrollingViewController ()
@property UILabel *longTextLabel;
@end

static NSString* const NAVIGATION_TITLE = @"Scrolling View";
static NSString* const LONG_TEXT_LABEL_CONTENT = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam finibus, velit a imperdiet blandit, urna odio vehicula elit, et aliquam nisl diam vitae diam. Fusce non viverra urna, eget bibendum leo. Donec sed congue nibh, vitae pulvinar velit. Maecenas semper tincidunt consectetur. Duis at consectetur quam, vel molestie eros. Aliquam bibendum augue scelerisque, auctor orci eu, iaculis turpis. Duis elit arcu, consequat nec metus a, rhoncus laoreet metus. Nulla tincidunt fringilla lacus, eget rutrum sapien scelerisque vitae. Quisque aliquam fringilla ante, eu pretium magna varius nec.\r\n\r\nInterdum et malesuada fames ac ante ipsum primis in faucibus. Cras ut magna in libero dignissim iaculis a a lectus. Vivamus porttitor et ipsum eget tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed consequat in ipsum at viverra. Nam porta eget ante convallis posuere. Aenean malesuada eu sem vitae volutpat. In non accumsan ligula, vitae fermentum magna. Suspendisse sed lorem nec dui volutpat tincidunt at eget nisl. Cras consequat, neque non mollis viverra, nisi felis mattis felis, ut tempor nisi felis vel nisi. Integer posuere augue nisl, sit amet gravida neque semper quis. Sed lorem justo, molestie vitae libero sit amet, luctus aliquam nisi. Sed hendrerit tortor odio. Cras tempor vehicula venenatis. Etiam tincidunt ultrices augue, non hendrerit risus ornare at. Curabitur tempus sem vitae eros maximus maximus.\r\n\r\nEtiam a cursus metus. Duis malesuada consequat nunc. Nullam sapien massa, molestie sed dignissim eu, imperdiet et risus. Quisque auctor semper tincidunt. Vestibulum sit amet purus sit amet ex dignissim consequat. Nullam hendrerit condimentum urna eu interdum. Fusce et augue placerat enim euismod tincidunt. Nulla sodales elementum lobortis. Nullam vel gravida tortor, vitae sagittis dui. Vivamus quis libero pretium, elementum dolor nec, vulputate sem. Aliquam sollicitudin orci ac turpis hendrerit luctus. Donec imperdiet neque quis vestibulum pharetra. Nunc quis mi eu odio consequat suscipit.\r\n\r\nMorbi nunc ipsum, elementum sed augue sit amet, interdum auctor leo. Phasellus non finibus nunc. Quisque consectetur ante quis aliquam tincidunt. Vivamus a elementum est. Sed hendrerit nibh nisl, ut venenatis arcu venenatis nec. Suspendisse ultricies odio vel consectetur volutpat. Nam libero odio, molestie faucibus vestibulum nec, placerat eget leo. Donec tellus erat, ultricies a nisi sed, dictum sodales ipsum. Sed vitae lectus at magna fringilla gravida vitae iaculis purus. Etiam porttitor iaculis tempus. Donec quis aliquam libero, eget ullamcorper orci.\r\n\r\nSed vel cursus est. Cras elementum turpis quis tristique ultrices. Donec scelerisque ipsum pretium, pharetra ipsum vel, auctor odio. Aliquam metus velit, dictum ac dui sit amet, venenatis aliquet nisi. Proin porttitor purus metus, eget lobortis metus sagittis iaculis. Ut aliquam massa orci, in lacinia ligula pulvinar nec. Sed arcu lacus, dignissim vel mattis vel, semper ac mi. Phasellus interdum aliquet neque, at efficitur ex placerat vitae. In sed ultrices est, nec porttitor augue. Suspendisse potenti. Integer tristique magna et neque congue lacinia. Curabitur vitae ultricies magna, sed semper tortor. Duis imperdiet eleifend sem. Vivamus commodo velit massa, in porttitor dui congue ut. In hac habitasse platea dictumst.\r\n\r\nMaecenas mattis nibh nec velit consequat imperdiet. Donec fermentum tincidunt velit ut placerat. Donec porttitor rutrum libero eget efficitur. Maecenas nec nisi eget dolor pellentesque fermentum. Praesent quis tempus massa, et ultrices dolor. Nulla mollis dolor odio, hendrerit vestibulum purus consectetur a. Cras condimentum lectus non consequat vestibulum. Vestibulum malesuada maximus pulvinar. In a mauris non ante bibendum varius. Donec quis odio massa. Sed consequat velit enim, vitae accumsan diam interdum ut. Mauris libero metus, dictum non lacus et, scelerisque molestie ligula. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus suscipit, tortor non dignissim faucibus, quam urna ornare urna, sed rutrum mauris libero vel urna.\r\n\r\nCras semper diam ac faucibus feugiat. Maecenas dictum placerat lectus, ut aliquam ipsum faucibus sit amet. Pellentesque non sem ut lectus volutpat sodales ut ut orci. Fusce nec commodo felis. Duis blandit a velit id gravida. Nullam ut est dolor. Praesent justo turpis, dictum vitae ultrices sit amet, convallis nec elit. Fusce enim magna, scelerisque sit amet auctor sed, euismod bibendum risus. Ut felis dui, mollis et lacinia ut, dignissim id massa.\r\n";

/**
 *  Scrolling view controller
 */
@implementation ScrollingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

/**
 *  Creates a scroll view and adds a long text label inside of it
 */
-(void)setUpView{
    self.navigationItem.title = NAVIGATION_TITLE;

    _longTextLabel = [[UILabel alloc] initWithFrame:[self frameFromCGPoint:CGPointZero AndCGSize:CGSizeMake([self getWidthMinusSmallPadding], 0)]];
    _longTextLabel.numberOfLines = 0;
    _longTextLabel.text = LONG_TEXT_LABEL_CONTENT;
    
    _longTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [_longTextLabel sizeToFit];
    [self centerViewByWidth:_longTextLabel];
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scroll.contentSize = _longTextLabel.frame.size;
    
    [scroll addSubview:_longTextLabel];
    [self.view addSubview:scroll];
}

@end
