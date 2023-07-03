//
//  UIViewContollerExtension.m
//  w405_w406_login_signup
//
//  Created by Gautam Sharma on 28/06/23.
//

#import "UIViewControllerExtension.h"
#import "StringExtension.h"
#import "Constants.h"


@implementation UIViewController (AlertBox)
-(void) presentAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
}
- (void)setCommonLayout:(UIView *) view {
    view.layer.cornerRadius = 7.0;
    view.layer.borderWidth = 1.0;
    view.layer.borderColor = UIColor.blackColor.CGColor;
    view.layer.backgroundColor = UIColor.whiteColor.CGColor;
}
-(void) navigation:(UIViewController *)Vc id:(NSString *) storyBoardId{
    Vc  = [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    [self.navigationController pushViewController:Vc animated:true];
}

- (void)validateEmailTextField:(UITextField *)textField range:(NSRange)range replacementString:(NSString *)string image:(UIImageView *) validEmail {
    NSString *updatedText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (updatedText.length == 0) {
        validEmail.hidden = YES;
    } else if ([updatedText validateString:updatedText regexValue:emailRegex]) {
        validEmail.hidden = NO;
        validEmail.image = [UIImage imageNamed:@"valid"];
    } else {
        validEmail.hidden = NO;
        validEmail.image = [UIImage imageNamed:@"invalid"];
    }
}

- (void)validatePasswordField:(UITextField *)textField range:(NSRange)range replacementString:(NSString *)string image:(UIImageView *) validPassword {
    NSString *updatedText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (updatedText.length == 0) {
        validPassword.hidden = YES;
    } else if ([updatedText validateString:updatedText regexValue:passwordRegex]) {
        validPassword.hidden = NO;
        validPassword.image = [UIImage imageNamed:@"valid"];
    } else {
        validPassword.hidden = NO;
        validPassword.image = [UIImage imageNamed:@"invalid"];
    }
}


@end
