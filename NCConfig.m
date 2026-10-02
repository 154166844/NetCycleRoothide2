#import "NCConfig.h"

static NSString * const kNCConfigPath = @"/var/mobile/Library/Preferences/com.zengweihong.netcycle.plist";

@implementation NCConfig

+ (instancetype)sharedConfig {
    static NCConfig *config;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[NCConfig alloc] init];
        [config load];
    });
    return config;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _wifiEnabled = NO;
        _bluetoothEnabled = NO;
        _wifiDate = nil;
        _bluetoothDate = nil;
    }
    return self;
}

- (void)load {
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:kNCConfigPath];
    if (![dict isKindOfClass:[NSDictionary class]]) {
        return;
    }

    NSNumber *wifiEnabled = dict[@"WiFiEnabled"];
    NSNumber *bluetoothEnabled = dict[@"BluetoothEnabled"];

    if ([wifiEnabled isKindOfClass:[NSNumber class]]) {
        _wifiEnabled = wifiEnabled.boolValue;
    }

    if ([bluetoothEnabled isKindOfClass:[NSNumber class]]) {
        _bluetoothEnabled = bluetoothEnabled.boolValue;
    }

    id wifiDate = dict[@"WiFiDate"];
    id bluetoothDate = dict[@"BluetoothDate"];

    if ([wifiDate isKindOfClass:[NSDate class]]) {
        _wifiDate = wifiDate;
    }

    if ([bluetoothDate isKindOfClass:[NSDate class]]) {
        _bluetoothDate = bluetoothDate;
    }
}

- (void)save {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];

    dict[@"WiFiEnabled"] = @(_wifiEnabled);
    dict[@"BluetoothEnabled"] = @(_bluetoothEnabled);

    if (_wifiDate) {
        dict[@"WiFiDate"] = _wifiDate;
    }

    if (_bluetoothDate) {
        dict[@"BluetoothDate"] = _bluetoothDate;
    }

    [dict writeToFile:kNCConfigPath atomically:YES];
}

- (void)setWiFiEnabled:(BOOL)enabled {
    _wifiEnabled = enabled;
    [self save];
}

- (void)setBluetoothEnabled:(BOOL)enabled {
    _bluetoothEnabled = enabled;
    [self save];
}

- (void)setWiFiDate:(NSDate *)date {
    _wifiDate = date;
    [self save];
}

- (void)setBluetoothDate:(NSDate *)date {
    _bluetoothDate = date;
    [self save];
}

@end
