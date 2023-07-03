//
//  SignUpViewController.h
//  w405_w406_login_signup
//
//  Created by Gautam Sharma on 28/06/23.
//

#import <UIKit/UIKit.h>


@interface SignUpViewController : UIViewController{
    
    __weak IBOutlet UITextField *emailField;
    __weak IBOutlet UITextField *passwordField;
    __weak IBOutlet UITextField *confirmpasswordField;
    
    __weak IBOutlet UIView *nameView;
    __weak IBOutlet UIView *emailView;
    __weak IBOutlet UIView *passwordView;
    __weak IBOutlet UIView *confirmPasswordView;
    
    __weak IBOutlet UIImageView *validPassword;
    __weak IBOutlet UIImageView *validEmail;
    __weak IBOutlet UIImageView *validConfirmPassword;
    
}

- (IBAction)signUpHandler:(id)sender;
- (IBAction)loginNavigation:(id)sender;


@end


