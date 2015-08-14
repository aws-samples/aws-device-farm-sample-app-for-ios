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



#import "CustomWebSitePickerViewController.h"
#import "WebViewController.h"

/**
 *  A web site picker to navigate to a specific web url
 */
@interface CustomWebSitePickerViewController ()
@property UIButton *goButton;
@property UITextField *urlInputTextField;
@end

static NSString* const FAULTY_URL_ERROR_MESSAGE_TITLE = @"Faulty URL Entered";
static NSString* const FAULTY_URL_ERROR_MESSAGE_MESSAGE = @"The url that you inputed: %@ is not in the right format. Please put in a url with the correct format. For example http://www.amazon.com";
static NSString* const ALERT_CANCEL_BUTTON_TITLE = @"OK";
static NSString* const SUBMIT_BUTTON_TTITLE = @"Go";
static NSString* const TEXT_FIELD_PLACE_HOLDER_WEBSITE = @"http://www.amazon.com";
static NSString* const TEXT_FIELD_ACCESSIBILITY_LABEL = @"navigation bar";
static NSString* const NAVIGATION_TITLE = @"Input a website";

@implementation CustomWebSitePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initComponents];
    [self configureComponents];
    [self displayComponents];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_urlInputTextField becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    _urlInputTextField.text = @"";
    [_urlInputTextField resignFirstResponder];
}


-(void)initComponents{
    self.navigationItem.title = NAVIGATION_TITLE;
    _goButton = [[UIButton alloc] initWithFrame:[self frameFromCGPoint:CGPointZero AndCGSize:[self getSmallSquareSize]]];
    _urlInputTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, [self getTopPositionRounded], [self getWidthMinusSmallPadding], [self getDefaultTextfieldHeight])];
}

-(void)configureComponents{
    _urlInputTextField.placeholder = TEXT_FIELD_PLACE_HOLDER_WEBSITE;
    _urlInputTextField.accessibilityLabel = TEXT_FIELD_ACCESSIBILITY_LABEL;
    _urlInputTextField.accessibilityIdentifier = TEXT_FIELD_ACCESSIBILITY_LABEL;
    
    _urlInputTextField.keyboardType = UIKeyboardTypeURL;
    _urlInputTextField.backgroundColor = [UIColor whiteColor];
    _urlInputTextField.borderStyle = UITextBorderStyleBezel;
    _urlInputTextField.textColor = [UIColor blackColor];
    _urlInputTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _urlInputTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    [_urlInputTextField addTarget:self action:@selector(goButtonPressed:) forControlEvents:UIControlEventEditingDidEndOnExit];

    [_goButton setTitle:SUBMIT_BUTTON_TTITLE forState:UIControlStateNormal];
    _goButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _goButton.titleLabel.font = [UIFont largeFont];
    _goButton.backgroundColor = [UIColor flatLightBlue];
    
    [_goButton addTarget:self action:@selector(goButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)displayComponents{
    [self centerViewByWidth:_urlInputTextField];
    [self centerViewByWidth:_goButton];
    
    [self putView:_goButton belowView:_urlInputTextField withPadding:[self getSmallHeightPadding]];
    
    [self.view addSubview:_urlInputTextField];
    [self.view addSubview:_goButton];
}

/**
 *  Goes to the enterned url
 *
 *  @param sender the go button
 */
-(void)goButtonPressed:(UIButton*)sender {
    [_urlInputTextField resignFirstResponder];
    NSURL *customURL = [NSURL URLWithString:_urlInputTextField.text];
    
    if (customURL && customURL.host && customURL.scheme) {
        WebViewController *customWebSite = [[WebViewController alloc] initWithURL:customURL];
        [self.navigationController pushViewController:customWebSite animated:YES];
        return;
    }
    [self displayErrorForImproperURL:customURL.absoluteString];
}

/**
 *  Error is displayed if the url is invalid
 *
 *  @param url the invalid url
 */
-(void)displayErrorForImproperURL:(NSString*)url{
    NSString *errorMessage = [NSString stringWithFormat:FAULTY_URL_ERROR_MESSAGE_MESSAGE, url];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:FAULTY_URL_ERROR_MESSAGE_TITLE message:errorMessage delegate:nil cancelButtonTitle:ALERT_CANCEL_BUTTON_TITLE otherButtonTitles:nil];
    [alert show];
}

@end
