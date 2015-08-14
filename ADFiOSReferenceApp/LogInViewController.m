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


#import "LogInViewController.h"

@interface LogInViewController ()
@property UITextField *userNameField;
@property UITextField *passwordField;
@property UILabel *statusMessageLabel;
@property UIButton *actionButton;
@end

static NSString *const USERNAME = @"admin";
static NSString *const PASSWORD = @"password";
static NSString *const USERNAME_FIELD_PLACEHOLDER = @"Username";
static NSString *const PASSWORD_FIELD_PLACEHOLDER = @"Password";
static NSString *const SUCCESS_MESSAGE = @"Logged in as admin";
static NSString *const FAIL_MESSAGE = @"PERMISSION DENIED";
static NSString *const LOGIN_BUTTON_TITLE = @"Login";
static NSString *const SUCCESS_BUTTON_TITLE = @"log out";
static NSString *const FAIL_BUTTON_TITLE = @"try again";

/**
 *  The controller for the login view
 */
@implementation LogInViewController

#pragma mark - Controller Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeMainTextFields];
    [self initializeActionButton];
    [self initializeAltScreen];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillHideNotification object:nil];
    [self displayMainView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self reDisplayMainView];
}

#pragma mark - Initialization Methods
/**
 *  Creates the action button
 */
-(void)initializeActionButton {
    //Setting up the button size
    CGSize actionButtonSize = CGSizeMake([self getWidthMinusLargePadding], [self getLargeHeightPadding]);
    _actionButton = [[UIButton alloc] initWithFrame:[self frameFromCGPoint:CGPointZero AndCGSize:actionButtonSize]];
    //placing the button (center at bottom)
    [self putViewAtBottom:_actionButton withPadding:[self getMicroHeightPadding]];
    [self centerViewByWidth:_actionButton];
}

/**
 *  Creates the second screen
 */
-(void)initializeAltScreen{
    _statusMessageLabel = [[UILabel alloc] initWithFrame: [self frameFromCGPoint:CGPointZero AndCGSize:CGSizeMake([self getWidthMinusSmallPadding], 0)]];
    [self fillScreenWithView:_statusMessageLabel];
    _statusMessageLabel.font = [UIFont largeFont];
    _statusMessageLabel.textAlignment = NSTextAlignmentCenter;
}

/**
 *  Creates the text field inputs
 */
-(void)initializeMainTextFields {
    CGSize inputFieldSize = CGSizeMake([self getWidthMinusLargePadding], [self getDefaultTextfieldHeight]);
    CGPoint inputFieldPoint = CGPointMake(0, [self getTopPosition] + [self getMicroHeightPadding]);
    
    _userNameField = [[UITextField alloc] initWithFrame:[self frameFromCGPoint:inputFieldPoint AndCGSize:inputFieldSize]];
    [self centerViewByWidth:_userNameField];
    [self configureTextFieldProperties:_userNameField withPlaceHolder:USERNAME_FIELD_PLACEHOLDER];
    
    _passwordField = [[UITextField alloc] initWithFrame:[self frameFromCGPoint:inputFieldPoint AndCGSize:inputFieldSize]];
    [self centerViewByWidth:_passwordField];
    [self putView:_passwordField belowView:_userNameField withPadding:[self getMicroHeightPadding]];
    
    [self configureTextFieldProperties:_passwordField withPlaceHolder:PASSWORD_FIELD_PLACEHOLDER];
    _passwordField.secureTextEntry = YES;
}

#pragma mark - Display Methods For Screens
/**
 *  Displays the main view
 */
-(void)displayMainView{
    [self displayActionButtonWithTitle:LOGIN_BUTTON_TITLE andAction:@selector(loginButtonPush:) andColor:[UIColor flatMidnightBlue]];
    [self.view addSubview:_passwordField];
    [self.view addSubview:_userNameField];
    [_userNameField becomeFirstResponder];
}

/**
 *  Reinitializes the main view
 */
-(void)reDisplayMainView {
    [self.view.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
    _userNameField.text = @"";
    _passwordField.text = @"";
    [self displayMainView];
}

/**
 *  Creates the login success screen
 */
-(void)buildSuccessScreen{
    [self displayAltScreenWithButtonTitle:SUCCESS_BUTTON_TITLE andStatusMessage:SUCCESS_MESSAGE andButtonColor:[UIColor flatMidnightBlue]];
}

/**
 *  Creates the login fail screen
 */
-(void)buildFailScreen{
    [self displayAltScreenWithButtonTitle:FAIL_BUTTON_TITLE andStatusMessage:FAIL_MESSAGE andButtonColor:[UIColor flatMidnightBlue]];
}

#pragma mark - Display Methods For Components
/**
 *  Displays the secondary screen with a specific button title, message, and color
 *
 *  @param buttonTitle the button title
 *  @param status      the message
 *  @param color       the button color
 */
-(void)displayAltScreenWithButtonTitle:(NSString*)buttonTitle andStatusMessage:(NSString*)status andButtonColor:(UIColor*)color{
    _statusMessageLabel.text = status;
    _actionButton.backgroundColor = color;
    [self displayActionButtonWithTitle:buttonTitle andAction:@selector(logoutButtonPressed:) andColor:color];
    [self.view addSubview:_statusMessageLabel];
}

/**
 *  Displays the action button with a specific title
 *
 *  @param title  the buttons title
 *  @param action the action of the button
 *  @param color  the buttons color
 */
-(void)displayActionButtonWithTitle:(NSString*)title andAction:(SEL)action andColor:(UIColor*)color{
    [self initializeActionButton];
    [_actionButton removeTarget:nil action:NULL forControlEvents:UIControlEventTouchUpInside];
    _actionButton.backgroundColor = color;
    [_actionButton setTitle:title forState:UIControlStateNormal];
    [_actionButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_actionButton];
}

#pragma mark - Configure Methods
/**
 *  Configures the text inputs within the app
 *
 *  @param field       the field to configure
 *  @param placeholder the field's placeholder text
 */
-(void)configureTextFieldProperties:(UITextField*)field withPlaceHolder:(NSString*)placeholder{
    field.borderStyle = UITextBorderStyleRoundedRect;
    field.font = [UIFont mediumFont];
    field.placeholder = placeholder;
    field.autocorrectionType = NO;
    field.keyboardType = UIKeyboardAppearanceDefault;
    field.clearButtonMode = UITextFieldViewModeWhileEditing;
    field.returnKeyType = UIReturnKeyDone;
    field.backgroundColor = [UIColor whiteColor];
    field.autocorrectionType = UITextAutocorrectionTypeNo;
    field.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [field addTarget:self action:@selector(loginButtonPush:) forControlEvents:UIControlEventEditingDidEndOnExit];
}

#pragma mark - Event Actions
/**
 *  Event when the keyboard is about to be show
 *
 *  Used to reposition the button
 *
 *  @param notification <#notification description#>
 */
-(void)keyboardWillShow: (NSNotification *) notification {
    CGFloat keyboardSize = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    CGRect newButtonFrame = _actionButton.frame;
    newButtonFrame.origin.y -= keyboardSize;
    _actionButton.frame = newButtonFrame;
}

/**
 *  Event when the login button is pushed
 *
 *  @param sender the login button
 */
-(void)loginButtonPush:(UIButton*)sender{
    [_actionButton removeFromSuperview];
    [_passwordField removeFromSuperview];
    [_userNameField removeFromSuperview];
    if ([_passwordField.text isEqualToString:PASSWORD] && [_userNameField.text isEqualToString:USERNAME]) {
        [self buildSuccessScreen];
    } else {
        [self buildFailScreen];
    }
}

/**
 *  Event when the logout/tryagain button is pressed
 *
 *  @param sender the logout/tryagain button
 */
-(void)logoutButtonPressed: (UIButton *) sender{
    [self reDisplayMainView];
}
@end