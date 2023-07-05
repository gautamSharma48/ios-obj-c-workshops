//
//  AppDelegate.h
//  w_409_core_data
//
//  Created by Gautam Sharma on 05/07/23.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@property (readonly ,strong) NSManagedObjectContext *managedObjectContext;
@property (readonly , strong,nonatomic) NSManagedObjectModel *mangedObjectModel;
@property (readonly , strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreContainer;
-(NSURL *) applicationDocumentDirectory;

@end

