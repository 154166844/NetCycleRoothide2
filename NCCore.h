#import <Foundation/Foundation.h>

@interface NCCore : NSObject

+ (instancetype)sharedCore;

- (void)start;
- (void)stop;

- (void)enableWiFiCycle;
- (void)disableWiFiCycle;

- (void)enableBluetoothCycle;
- (void)disableBluetoothCycle;

@end
