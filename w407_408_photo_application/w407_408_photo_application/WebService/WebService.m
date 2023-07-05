//
//  WebServiceViewController.m
//  w407_408_photo_application
//
//  Created by Gautam Sharma on 04/07/23.
//

#import "WebService.h"

@implementation WebService

- (void)getPhotsApi:(CompletionBlock)completion  {
    NSString *urlString = @"https://jsonplaceholder.typicode.com/photos";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error) {
               completion(nil, error);
               return;
           }
        NSError *jsonError;
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
        if(jsonError){
            completion(nil,jsonError);
        };
        completion(array,nil);
    }];
    [dataTask resume];
}

@end
