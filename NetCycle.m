#import "NetCycle.h"
#import "NCCore.h"
#import "NCPreferences.h"

@implementation NetCycle

+ (instancetype)sharedInstance {
    static NetCycle *instance;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        instance = [[NetCycle alloc] init];
    });

    return instance;
}

- (void)start {
    NCPreferences *preferences = [NCPreferences sharedPreferences];

    if (!preferences.enabled) {
        return;
    }

    [[NCCore sharedCore] start];
}

- (void)stop {
    [[NCCore sharedCore] stop];
}

@end
