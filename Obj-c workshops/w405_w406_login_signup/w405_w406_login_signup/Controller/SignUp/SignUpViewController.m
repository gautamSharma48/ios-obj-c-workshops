//
//  SignUpViewController.m
//  w405_w406_login_signup
//
//  Created by Gautam Sharma on 28/06/23.
//

#import "SignUpViewController.h"
#import "UIViewControllerExtension.h"
#import "StringExtension.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    passwordField.secureTextEntry=YES;
    confirmpasswordField.secureTextEntry = YES;
}


- (IBAction)signUpHandler:(id)sender {
    NSString *email = emailField.text;
    NSString *password = passwordField.text;
    NSString *confirmPassword = confirmpasswordField.text;
    
    if([email length]== 0 || [password length] == 0 || [confirmPassword length] == 0){
        return [self presentAlertWithTitle:@"Alert" message:@""];
    }
    
    if(![email validateString:email regexValue:@""]){
        return [self presentAlertWithTitle:@"" message:@""];
    }
    
    
    if(![password validateString:password    regexValue:@""] || password != confirmPassword){
        return [self presentAlertWithTitle:@"" message:@""];
    }
    
    [self presentAlertWithTitle:@"" message:@""];
    
    
}
@end
