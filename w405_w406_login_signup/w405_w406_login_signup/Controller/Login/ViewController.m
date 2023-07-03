//
//  ViewController.m
//  w405_w406_login_signup
//
//  Created by Gautam Sharma on 28/06/23.
//



#import "ViewController.h"
#import "UIViewControllerExtension.h"
#import "StringExtension.h"
#import "SignUpViewController.h"
#import  "Constants.h"
#import "DashboardViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    emailField.delegate = self;
    passwordField.delegate = self;
    passwordField.secureTextEntry = YES;
    validEmail.hidden = YES;
    validPassword.hidden = YES;
    [self setCommonLayout:emailView];
    [self setCommonLayout:passwordView];
    
}

- (IBAction)signUpButton:(id)sender {
    SignUpViewController *signupContoller;
    [self navigation:signupContoller id:@"SignUpViewController"];
}

- (IBAction)loginHandler:(id)sender {
    NSString *email = emailField.text;
    NSString *password = passwordField.text;
    DashboardViewController *dashboardViewController;
    
    if([email  length] == 0 || [password  length] == 0 ) {
        [self presentAlertWithTitle:@"Alert" message:@"please add Details"];
    }
    
    BOOL emailValid = [email validateString:email  regexValue:emailRegex];
    BOOL passwordValid = [password validateString:password regexValue:passwordRegex];
    
    if(!emailValid) {
        return [self presentAlertWithTitle:@"Alert" message:emailValidationFailed ];
    }
    
    if(!passwordValid){
        return [self presentAlertWithTitle:@"Alert" message:passwordValidationFailed];
    }
    
    if(emailValid && passwordValid){
        [self navigation:dashboardViewController id:@"DashboardViewController"];
        return [self presentAlertWithTitle:@"Login" message:loginSuccess];
    }
    
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField == emailField){
        [self validateEmailTextField:textField range:range replacementString:string image:validEmail];
    }
    else{
        [self validatePasswordField:textField range:range replacementString:string image:validPassword];
    }
    return  YES;
}

@end
