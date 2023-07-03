

#import <UIKit/UIKit.h>


@interface UIViewController (AlertBox)
- (void)presentAlertWithTitle:(NSString *)title message:(NSString *)message;
- (void)setCommonLayout:(UIView *) view ;
-(void) navigation:(UIViewController *)Vc id:(NSString *) storyBoardId;
- (void)validateEmailTextField:(UITextField *)textField range:(NSRange)range replacementString:(NSString *)string image:(UIImageView *) validEmail;
-(void)validatePasswordField:(UITextField *)textField range:(NSRange)range replacementString:(NSString *)string image:(UIImageView *) validPassword ;
@end
