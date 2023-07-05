//
//  ViewController.h
//  w407_408_photo_application
//
//  Created by Gautam Sharma on 04/07/23.
//

#import <UIKit/UIKit.h>
#import "WebService.h"

@interface ViewController : UIViewController{
    NSString *cacheDir ;

};
@property(strong, nonatomic)NSMutableArray *arrayImage;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (nonatomic, strong) WebService *apiService;
@end

