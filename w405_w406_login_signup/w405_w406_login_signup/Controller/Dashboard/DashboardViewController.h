//
//  DashboardViewController.h
//  w405_w406_login_signup
//
//  Created by Gautam Sharma on 03/07/23.
//

#import <UIKit/UIKit.h>


@interface DashboardViewController : UIViewController

@property (strong , nonatomic) IBOutlet UITableView *myTableView;
@property(strong, nonatomic)NSMutableArray * arrdata;

-(void) config;
@end


