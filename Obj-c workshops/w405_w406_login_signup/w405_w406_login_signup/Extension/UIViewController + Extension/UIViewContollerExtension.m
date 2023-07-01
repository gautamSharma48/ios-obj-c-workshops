//
//  UIViewContollerExtension.m
//  w405_w406_login_signup
//
//  Created by Gautam Sharma on 28/06/23.
//

#import "UIViewControllerExtension.h"


@implementation UIViewController (AlertBox)
-(void) presentAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}
@end
