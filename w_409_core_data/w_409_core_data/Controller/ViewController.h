//
//  ViewController.h
//  w_409_core_data
//
//  Created by Gautam Sharma on 05/07/23.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "DatabaseManager.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (strong , nonatomic) AppDelegate *delegate;

@property (strong) NSManagedObject *contactDb;
- (IBAction)RegisterButton:(id)sender;
- (IBAction)CoreData:(id)sender;
- (IBAction)userDefaults:(id)sender;
- (IBAction)keyChain:(id)sender;

@end

