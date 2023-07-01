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
    
    
    
}


- (IBAction)signUpButton:(id)sender {
    SignUpViewController *signup = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    [self.navigationController pushViewController:signup animated:true];
}

- (IBAction)loginHandler:(id)sender {
    NSString *email = emailField.text;
    NSString *password = passwordField.text;
    
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
        return [self presentAlertWithTitle:@"Login" message:loginSuccess];
    }
    
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField == emailField){
        [self validateEmailTextField:textField range:range replacementString:string];
    }
    else{
        [self validatePasswordField:textField range:range replacementString:string];
    }
    return  YES;
}

- (void)validateEmailTextField:(UITextField *)textField range:(NSRange)range replacementString:(NSString *)string {
    NSString *updatedText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if(updatedText.length == 0){
        validEmail.hidden = YES;
    }
    else if([updatedText validateString:updatedText regexValue:emailRegex]){
        validEmail.hidden = NO;
        validEmail.image = [UIImage imageNamed:@"valid"];
    }
    else{
        NSLog(@"asdfasf");
        validEmail.hidden = NO;
        validEmail.image = [UIImage imageNamed:@"invalid"];
    }
    
}

- (void)validatePasswordField:(UITextField *)textField range:(NSRange)range replacementString:(NSString *)string {
    NSString *updatedText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if(updatedText.length == 0){
        validPassword.hidden = YES;
    }
    else if([updatedText validateString:updatedText regexValue:passwordRegex]){
        validPassword.hidden = NO;
        validPassword.image = [UIImage imageNamed:@"valid"];
    }
    else{
        validPassword.hidden = NO;
        validPassword.image = [UIImage imageNamed:@"invalid"];
    }
    
}
@end
