//
//  SignUpViewController.m
//  w405_w406_login_signup
//
//  Created by Gautam Sharma on 28/06/23.
//

#import "SignUpViewController.h"
#import "UIViewControllerExtension.h"
#import "StringExtension.h"
#import "Constants.h"
#import "DashboardViewController.h"

@interface SignUpViewController () <UITextFieldDelegate>

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    emailField.delegate = self;
    passwordField.delegate = self;
    confirmpasswordField.delegate = self;
    
    passwordField.secureTextEntry = YES;
    confirmpasswordField.secureTextEntry = YES;
    
    validEmail.hidden = YES;
    validPassword.hidden = YES;
    validConfirmPassword.hidden = YES;
    
    [self setCommonLayout:nameView];
    [self setCommonLayout:emailView];
    [self setCommonLayout:passwordView];
    [self setCommonLayout:confirmPasswordView];
}


- (IBAction)loginNavigation:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)signUpHandler:(id)sender {
    NSString *email = emailField.text;
    NSString *password = passwordField.text;
    NSString *confirmPassword = confirmpasswordField.text;
    DashboardViewController *dashboardViewContoller;
    
    if([email length]== 0 || [password length] == 0 || [confirmPassword length] == 0){
        return [self presentAlertWithTitle:@"Alert" message:blankField];
    }
    
    BOOL emailValid = [email validateString:email  regexValue:emailRegex];
    BOOL passwordValid = [password validateString:password regexValue:passwordRegex];
    BOOL conFirmPasswordCheck = [password isEqualToString:confirmPassword];
    
    if(!emailValid){
        return [self presentAlertWithTitle:@"Alert" message:emailValidationFailed];
    }
    
    if(!passwordValid || !conFirmPasswordCheck){
        return [self presentAlertWithTitle:@"Alert" message:passwordValidationFailed];
    }
    
    [self navigation:dashboardViewContoller id:@"DashboardViewController"];
    [self presentAlertWithTitle:@"Register" message:RegistrationSuccess];
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField == emailField){
        [self validateEmailTextField:textField range:range replacementString:string image:validEmail];
    }
    else if(textField == passwordField){
        [self validatePasswordField:textField range:range replacementString:string image:validPassword];
    }
    else{
        [self validatePasswordField:textField range:range replacementString:string image:validConfirmPassword];
    }
    return  YES;
}
@end
