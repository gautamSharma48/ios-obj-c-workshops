//
//  WebServiceViewController.h
//  w407_408_photo_application
//
//  Created by Gautam Sharma on 04/07/23.
//

#import <UIKit/UIKit.h>

typedef void (^CompletionBlock)(NSArray *arrayOfObjects, NSError *error);
@interface WebService: NSObject
-(void) getPhotsApi:(CompletionBlock)completion;
@end

