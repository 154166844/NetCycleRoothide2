#import "NCCore.h"
#import "NCConfig.h"

@implementation NCCore

+ (instancetype)sharedCore {
    static NCCore *core;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        core = [[NCCore alloc] init];
    });
    return core;
}

- (void)start {
    NCConfig *config = [NCConfig sharedConfig];

    if (config.wifiEnabled) {
        [self enableWiFiCycle];
    }

    if (config.bluetoothEnabled) {
        [self enableBluetoothCycle];
    }
}

- (void)stop {
    // Stop active NetCycle tasks.
}

- (void)enableWiFiCycle {
    NCConfig *config = [NCConfig sharedConfig];

    config.wifiEnabled = YES;
    config.wifiDate = [NSDate date];
}

- (void)disableWiFiCycle {
    NCConfig *config = [NCConfig sharedConfig];

    config.wifiEnabled = NO;
    config.wifiDate = nil;
}

- (void)enableBluetoothCycle {
    NCConfig *config = [NCConfig sharedConfig];

    config.bluetoothEnabled = YES;
    config.bluetoothDate = [NSDate date];
}

- (void)disableBluetoothCycle {
    NCConfig *config = [NCConfig sharedConfig];

    config.bluetoothEnabled = NO;
    config.bluetoothDate = nil;
}

@end
