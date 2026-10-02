#import "NCPreferences.h"

static NSString * const kNCPreferencesPath =
    @"/var/mobile/Library/Preferences/com.zengweihong.netcycle.plist";

@implementation NCPreferences

+ (instancetype)sharedPreferences {
    static NCPreferences *preferences;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        preferences = [[NCPreferences alloc] init];
        [preferences load];
    });

    return preferences;
}

- (instancetype)init {
    self = [super init];

    if (self) {
        _enabled = YES;
        _wifiEnabled = NO;
        _bluetoothEnabled = NO;
    }

    return self;
}

- (void)load {
    NSDictionary *dict =
        [NSDictionary dictionaryWithContentsOfFile:kNCPreferencesPath];

    if (![dict isKindOfClass:[NSDictionary class]]) {
        return;
    }

    NSNumber *enabled = dict[@"Enabled"];
    NSNumber *wifiEnabled = dict[@"WiFiEnabled"];
    NSNumber *bluetoothEnabled = dict[@"BluetoothEnabled"];

    if ([enabled isKindOfClass:[NSNumber class]]) {
        _enabled = enabled.boolValue;
    }

    if ([wifiEnabled isKindOfClass:[NSNumber class]]) {
        _wifiEnabled = wifiEnabled.boolValue;
    }

    if ([bluetoothEnabled isKindOfClass:[NSNumber class]]) {
        _bluetoothEnabled = bluetoothEnabled.boolValue;
    }
}

- (void)save {
    NSDictionary *dict = @{
        @"Enabled": @(_enabled),
        @"WiFiEnabled": @(_wifiEnabled),
        @"BluetoothEnabled": @(_bluetoothEnabled)
    };

    [dict writeToFile:kNCPreferencesPath atomically:YES];
}

- (void)reset {
    _enabled = YES;
    _wifiEnabled = NO;
    _bluetoothEnabled = NO;

    [self save];
}

- (void)setEnabled:(BOOL)enabled {
    _enabled = enabled;
    [self save];
}

- (void)setWifiEnabled:(BOOL)wifiEnabled {
    _wifiEnabled = wifiEnabled;
    [self save];
}

- (void)setBluetoothEnabled:(BOOL)bluetoothEnabled {
    _bluetoothEnabled = bluetoothEnabled;
    [self save];
}

@end
