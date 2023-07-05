//
//  DashboardViewController.h
//  w405_w406_login_signup
//
//  Created by Gautam Sharma on 03/07/23.
//

#import <UIKit/UIKit.h>


@interface DashboardViewController : UIViewController

@property (strong , nonatomic) IBOutlet UITableView *myTableView;
//property mytablevie respersent the table view user interfaace,
//strong attribute respresent the strong reference to the table view and it preventing the deallocated as long as the property exists.
//non atomic is used for property can be accessed through the muliple thread.
@property(strong, nonatomic)NSMutableArray * arrdata;

-(void) config;
@end


