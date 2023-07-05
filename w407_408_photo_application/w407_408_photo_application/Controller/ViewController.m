//
//  ViewController.m
//  w407_408_photo_application
//
//  Created by Gautam Sharma on 04/07/23.
//

#import "ViewController.h"
#import "String + Extension.h"

@interface ViewController () <UICollectionViewDelegate , UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.apiService = [[WebService alloc] init];
    [self fetchApi];
    _myCollectionView.delegate=self;
    _myCollectionView.dataSource = self;
}

-(void) fetchApi{
    [self.apiService getPhotsApi:^(NSArray *arrayOfObjects, NSError *error) {
        if(error){
            NSLog(@"Error: %@", error);
            return;
        }
        NSMutableArray *imageURLs = [[NSMutableArray alloc] init];
               for (NSDictionary *objectDict in arrayOfObjects) {
                   NSString *imageURLString = objectDict[@"url"]; // Replace "imageUrl" with the actual key for the image URL in the API response
                   if (imageURLString) {
                       [imageURLs addObject:imageURLString];
                   }
               }
        self->_arrayImage = imageURLs;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myCollectionView reloadData];
        });
    }];
}



- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  _arrayImage.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView
                                  dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIImageView *image1 = (UIImageView *)[cell viewWithTag:1];
    NSURL *imageUrl =[NSURL URLWithString:[_arrayImage objectAtIndex:indexPath.row]];
    [image1 setImageWithURL:imageUrl];
    return cell;
}

@end
