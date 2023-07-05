//
//  DatabaseManager.h
//  w_409_core_data
//
//  Created by Gautam Sharma on 05/07/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DatabaseManager : UIViewController
-(void) setUserDefaults:(NSString *)name email:(NSString *)email;
-(NSDictionary *) retriveUserDefaults;
-(NSString *) getValueFromKeyChain;
-(void) setValueKeyChain:(NSString *) pass;
@end

NS_ASSUME_NONNULL_END
