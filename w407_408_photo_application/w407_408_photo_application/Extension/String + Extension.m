//
//  ViewController.m
//  w407_408_photo_application
//
//  Created by Gautam Sharma on 04/07/23.
//

#import "ViewController.h"

@implementation UIImageView (URLLoading)

- (void)setImageWithURL:(NSURL *)url {
    self.image = nil;
    // Check if image exists in cache directory
       NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
       NSString *filePath = [cacheDirectory stringByAppendingPathComponent:url.lastPathComponent];
       
       UIImage *cachedImage = [UIImage imageWithContentsOfFile:filePath];
       if (cachedImage) {
           // Image exists in cache directory, load it directly
           self.image = cachedImage;
           return;
       }
       
       // Create and start the loader
    UIActivityIndicatorView *loader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
       loader.center = self.center;
       [self addSubview:loader];
       [loader startAnimating];
       
       // Image doesn't exist in cache directory, download it from the URL
       NSURLSession *session = [NSURLSession sharedSession];
       NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
           if (error) {
               NSLog(@"Could not load image: %@", error);
               [self handleImageLoadingError:loader];
               return;
           }
           
           NSFileManager *fileManager = [NSFileManager defaultManager];
          
           
           // Create the cache directory if it doesn't exist
           if (![fileManager fileExistsAtPath:cacheDirectory]) {
               NSError *createDirectoryError;
               [fileManager createDirectoryAtPath:cacheDirectory withIntermediateDirectories:YES attributes:nil error:&createDirectoryError];
               
               if (createDirectoryError) {
                   NSLog(@"Failed to create cache directory: %@", createDirectoryError);
                   [self handleImageLoadingError:loader];
                   return;
               }
           }
           
           // Move the downloaded file to the cache directory
           NSError *moveError;
           BOOL success = [fileManager moveItemAtURL:location toURL:[NSURL fileURLWithPath:filePath] error:&moveError];
           if (success) {
               UIImage *newImage = [UIImage imageWithContentsOfFile:filePath];
               if (newImage) {
                   dispatch_async(dispatch_get_main_queue(), ^{
                       self.image = newImage;
                       [loader stopAnimating];
                       [loader removeFromSuperview];
                   });
               } else {
                   NSLog(@"Failed to load image from cache directory");
                   [self handleImageLoadingError:loader];
               }
           } else {
               NSLog(@"Failed to save image to cache directory: %@", moveError);
               [self handleImageLoadingError:loader];
           }
       }];
       
       [downloadTask resume];
}

- (void)handleImageLoadingError:(UIActivityIndicatorView *)loader {
    dispatch_async(dispatch_get_main_queue(), ^{
        [loader stopAnimating];
        [loader removeFromSuperview];
    });
}

- (void)saveImageToCacheDirectory:(NSURL *)location filePath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    BOOL success = [fileManager moveItemAtURL:location toURL:[NSURL fileURLWithPath:filePath] error:&error];
    if (!success) {
        NSLog(@"Failed to save image to cache directory: %@", error);
    }
}
@end
