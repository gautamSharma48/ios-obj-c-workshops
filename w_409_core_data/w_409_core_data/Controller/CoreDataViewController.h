//
//  CoreDataViewController.h
//  w_409_core_data
//
//  Created by Gautam Sharma on 05/07/23.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface CoreDataViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong) NSMutableArray *contactArray;
@property (strong ,nonatomic) AppDelegate *delegate;
@end

