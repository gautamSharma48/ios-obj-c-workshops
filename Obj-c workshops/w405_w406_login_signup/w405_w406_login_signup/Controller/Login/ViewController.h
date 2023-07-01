//
//  ViewController.h
//  w405_w406_login_signup
//
//  Created by Gautam Sharma on 28/06/23.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    
    __weak IBOutlet UITextField *passwordField;
    __weak IBOutlet UITextField *emailField;
    
    __weak IBOutlet UIImageView *validEmail;
    
    __weak IBOutlet UIImageView *validPassword;
    __weak IBOutlet UIView *emailView;
    __weak IBOutlet UIView *passwordView;
    
    
}

- (IBAction)loginHandler:(id)sender;
- (IBAction)signUpButton:(id)sender;
-  (void) setCommonLayout;


@end

