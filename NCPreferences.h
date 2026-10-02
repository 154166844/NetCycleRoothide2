#import <Foundation/Foundation.h>

@interface NCPreferences : NSObject

+ (instancetype)sharedPreferences;

@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, assign) BOOL wifiEnabled;
@property (nonatomic, assign) BOOL bluetoothEnabled;

- (void)load;
- (void)save;
- (void)reset;

@end
