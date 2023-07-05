//
//  CoreDataViewController.m
//  w_409_core_data
//
//  Created by Gautam Sharma on 05/07/23.
//

#import "CoreDataViewController.h"

@interface CoreDataViewController () <UITableViewDataSource ,UITableViewDelegate>

@end

@implementation CoreDataViewController

-(NSManagedObjectContext *) managedobjectContext {
    NSManagedObjectContext *context = nil;
    _delegate =(AppDelegate *)[[UIApplication sharedApplication]delegate];
    if([_delegate respondsToSelector:@selector(persistentContainer)]){
        context = _delegate.persistentContainer.viewContext;
    }
    return  context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    // Do any additional setup after loading the view.
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSManagedObjectContext *managedObjectContext = [self managedobjectContext];
    NSFetchRequest *fetchedRequest = [[NSFetchRequest alloc] initWithEntityName:@"Register"];
    
    self.contactArray = [[managedObjectContext executeFetchRequest:fetchedRequest error:nil]mutableCopy];
    [self.myTableView reloadData];
}
#pragma mark - Core Data Controller


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [self.contactArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSManagedObject *device = [self.contactArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:[device valueForKey:@"name"]];
    [cell.detailTextLabel setText:[device valueForKey:@"email"]];
    return  cell;
}
@end
