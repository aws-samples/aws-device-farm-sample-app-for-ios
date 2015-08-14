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


#import "WebViewController.h"

/**
 *  A controller to test a web view
 */
@interface WebViewController ()
@property UIWebView *webView;
@property UILabel *errorLabel;
@property NSURL *URL;
@end

static NSString* const DEFAULT_URL = @"http://www.amazon.com";
static NSString* const ERROR_MESSAGE_FORMAT = @"\"%@\" is a malformed URL. Please enter a URL in the correct format. An example would be %@";
@implementation WebViewController

/**
 *  Create with a specific url
 *
 *  @param url the given url
 *
 *  @return the created web view controller
 */
-(id)initWithURL:(NSURL*)url{
    self = [super init];
    if (self) {
        _URL = url;
    }
    return self;
}

/**
 *  Creates the webview controller with a specific title and image
 *
 *  @param title webview tabbar title
 *  @param image webview tabbar image
 *
 *  @return the webview controller
 */
-(id)initWithTitle:(NSString *)title andImage:(UIImage *)image {
    self = [super initWithTitle:title andImage:image];
    if (self) {
        _URL = [NSURL URLWithString:DEFAULT_URL];
    }
    return self;
}

/**
 *  Creates the webview controller with specific (tabbar title and image) and url
 *
 *  @param title tabbar title
 *  @param image tabbar image
 *  @param url   webview url
 *
 *  @return the webview
 */
-(id)initWithTitle:(NSString *)title andImage:(UIImage *)image andURL:(NSURL*)url{
    self = [super initWithTitle:title andImage:image];
    if (self) {
        _URL = url;
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    _webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    _webView.delegate = self;
    _webView.accessibilityLabel = @"webview";
    [self.view addSubview:_webView];
}

/**
 *  Displays the webview
 *
 *  @param animated is the view animated
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setUpWebView];
    [self loadWebSite];
}

/**
 *  Fills the screen with the webview
 */
-(void)setUpWebView {
    [self fillScreenWithView:_webView];
}

/**
 *  Loads the webview
 */
-(void)loadWebSite{
    if (_URL && _URL.host && _URL.scheme) {
        [_webView loadRequest:[NSURLRequest requestWithURL:_URL]];
        return;
    }
    NSLog(@"bad URL");
    [_webView removeFromSuperview];
    [self createErrorLabel:[NSString stringWithFormat:ERROR_MESSAGE_FORMAT, _URL.absoluteString, DEFAULT_URL]];
}

/**
 *  Creates an error if the URL is bad
 *
 *  @param errorMessage error message
 */
-(void)createErrorLabel:(NSString*)errorMessage{
    _errorLabel = [[UILabel alloc] initWithFrame:[self frameFromCGPoint:CGPointZero AndCGSize:CGSizeMake([self getWidthMinusSmallPadding], 0)]];
    _errorLabel.textAlignment = NSTextAlignmentCenter;
    _errorLabel.numberOfLines = 0;
    _errorLabel.font = [UIFont largeFont];
    _errorLabel.text = errorMessage;
    [_errorLabel sizeToFit];
    
    [self centerView:_errorLabel];
    [self.view addSubview:_errorLabel];
}

/**
 *  Sets the accessibility for the webview to fail if the webview failed (used for testing)
 *
 *  @param webView the webview
 *  @param error   the error
 */
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"FAIL");
    _webView.accessibilityIdentifier = @"webview failure";
}

/**
 *  Sets the accessibility for the webview to loaded if the webview succeded (used for testing)
 *
 *  @param webView the webview 
 */
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"Finished");
    _webView.accessibilityIdentifier = @"webview loaded";
}

@end
