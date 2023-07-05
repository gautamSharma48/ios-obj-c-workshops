//
//  ViewController.m
//  w_409_core_data
//
//  Created by Gautam Sharma on 05/07/23.
//

#import "ViewController.h"
#import "CoreDataViewController.h"
#import "DatabaseManager.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSManagedObjectContext *) managedobjectContext {
    NSManagedObjectContext *context = nil;
    _delegate =(AppDelegate *)[[UIApplication sharedApplication]delegate];
    if([_delegate respondsToSelector:@selector(persistentContainer)]){
        context = _delegate.persistentContainer.viewContext;
    }
    return  context;
}

- (IBAction)keyChain:(id)sender {
    DatabaseManager *db = [[DatabaseManager alloc]init];
    NSString *getPass = [db getValueFromKeyChain];
    [self AlertBox:@"user default" value:getPass] ;
}

- (IBAction)userDefaults:(id)sender {
    DatabaseManager *db = [[DatabaseManager alloc]init];
    NSDictionary *userData =  [db retriveUserDefaults];
    if(userData != nil){
        NSString *name = userData[@"name"];
        NSString *email = userData[@"email"];
        [_nameField setText:name];
        [_emailField setText:email];
        NSLog(_emailField.text,_nameField.text);
        [self AlertBox:@"user default" value:[name stringByAppendingString:email]];
    }
}

- (IBAction)CoreData:(id)sender {
    
    CoreDataViewController *coreDataViewController;
    coreDataViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"CoreDataViewController"];
    [self.navigationController pushViewController:coreDataViewController animated:true];
}

- (IBAction)RegisterButton:(id)sender {
    DatabaseManager *db = [[DatabaseManager alloc]init];
    [db setUserDefaults:_nameField.text email:_emailField.text];
    [db setValueKeyChain:_passwordField.text];
    if([_nameField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_emailField.text isEqualToString:@""]){
        return;
    }
    NSManagedObjectContext *context = [self managedobjectContext];
    NSManagedObject *transaction = [NSEntityDescription insertNewObjectForEntityForName:@"Register" inManagedObjectContext:context];
    
    
    [transaction setValue:self.nameField.text forKey:@"name"];
    [transaction setValue:self.emailField.text forKey:@"email"];
    
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Save Failed! %@ %@", error, [error localizedDescription]);
    }
    
}

-(void) AlertBox: (NSString *) title value:(NSString *) value  {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:value preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
