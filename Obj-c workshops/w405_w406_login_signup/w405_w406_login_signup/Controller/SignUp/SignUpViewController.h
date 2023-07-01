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
}

- (IBAction)signUpHandler:(id)sender;


@end


