//
//  DashboardViewController.m
//  w405_w406_login_signup
//
//  Created by Gautam Sharma on 03/07/23.
//

#import "DashboardViewController.h"
#import "CustomCellView.h"

@interface DashboardViewController () <UITableViewDelegate , UITableViewDataSource>

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    CustomCellView *cell1 = [[CustomCellView alloc]init];
    cell1.name = @"ABC Corporation";
    cell1.order = @"Order No. 1728029";
    CustomCellView *cell2 = [[CustomCellView alloc]init];
    cell2.name = @"ABC Corporation";
    cell2.order = @"Order No. 2728028";
    _arrdata= [[NSMutableArray alloc] initWithObjects:cell1,cell2, nil];
    [self config];
}

-(void)config{
    self.title = @"Dashboard";
    
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor =[UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    UIImage *searchImage = [UIImage systemImageNamed:@"magnifyingglass"];
    UIImage *drawer = [UIImage systemImageNamed:@"line.horizontal.3"];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:searchImage style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:drawer style:UIBarButtonItemStylePlain target:self action:nil];
    rightButton.tintColor = [UIColor whiteColor];
    leftButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightButton;
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIView *statusBarView = [[UIView alloc] init];
    statusBarView.backgroundColor = [UIColor redColor];
    [self.view addSubview:statusBarView];
    statusBarView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *topConstraint = [statusBarView.topAnchor constraintEqualToAnchor:self.view.topAnchor];
    NSLayoutConstraint *leadingConstraint = [statusBarView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor];
    NSLayoutConstraint *trailingConstraint = [statusBarView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor];
    NSLayoutConstraint *bottomConstraint = [statusBarView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor];
    
    [NSLayoutConstraint activateConstraints:@[topConstraint, leadingConstraint, trailingConstraint, bottomConstraint]];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _arrdata.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        return cell;
    }
    CustomCellView *mainCell = [_arrdata objectAtIndex:indexPath.row];
    UILabel *label1 = (UILabel *)[cell viewWithTag:1];
    label1.text = mainCell.order;
    UILabel *label2 = (UILabel *)[cell viewWithTag:2];
    label2.text = mainCell.name;
    return  cell;
}

@end
