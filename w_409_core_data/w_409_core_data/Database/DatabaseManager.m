//
//  DatabaseManager.m
//  w_409_core_data
//
//  Created by Gautam Sharma on 05/07/23.
//

#import "DatabaseManager.h"

@interface DatabaseManager ()

@end

@implementation DatabaseManager

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void) setUserDefaults:(NSString *)name email:(NSString *)email{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:name forKey:@"nameKey"];
    [defaults setObject:email forKey:@"emailKey"];
    [defaults synchronize];
}

-(NSDictionary *) retriveUserDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [defaults objectForKey:@"nameKey"];
    NSString *email = [defaults objectForKey:@"emailKey"];
    NSDictionary *userData = @{
        @"name":name,
        @"email":email
    };
    return  userData;
}

-(void) setValueKeyChain:(NSString *) pass{
    NSString *password = pass;
    
    // Convert the password to data
    NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];
    // Create a dictionary to configure the Keychain search
    NSDictionary *searchQuery = @{
        (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrService: @"MyApp",
        (__bridge id)kSecAttrAccount: @"MyAccount"
    };
    // Delete the existing password from the Keychain
     SecItemDelete((__bridge CFDictionaryRef)searchQuery);
    // Prepare the dictionary to add the password to the Keychain
    NSMutableDictionary *keychainQuery = [searchQuery mutableCopy];
    [keychainQuery setObject:passwordData forKey:(__bridge id)kSecValueData];
    
    // Add the password to the Keychain
     SecItemAdd((__bridge CFDictionaryRef)keychainQuery, NULL);
}

-(NSString *) getValueFromKeyChain{
    // Prepare the search query to find the password in the Keychain
    NSDictionary *searchQuery = @{
        (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrService: @"MyApp",
        (__bridge id)kSecAttrAccount: @"MyAccount",
        (__bridge id)kSecMatchLimit: (__bridge id)kSecMatchLimitOne,
        (__bridge id)kSecReturnData: (__bridge id)kCFBooleanTrue
    };
    
    // Retrieve the password from the Keychain
    CFTypeRef dataTypeRef = NULL;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)searchQuery, &dataTypeRef);
    
    if (status == errSecSuccess) {
        NSLog(@"Password retrieval failed with status: %d", (int)status);
    }
    NSData *passwordData = (__bridge_transfer NSData *)dataTypeRef;
    NSString *retrievedPassword = [[NSString alloc] initWithData:passwordData encoding:NSUTF8StringEncoding];
    NSLog(@"Retrieved password: %@", retrievedPassword);
    return retrievedPassword;;
    
}
@end
