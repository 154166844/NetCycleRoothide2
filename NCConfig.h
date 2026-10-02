#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NCConfig : NSObject
@property(nonatomic) BOOL wifiEnabled;
@property(nonatomic) BOOL bluetoothEnabled;
@property(nonatomic, copy) NSString *wifiAction;
@property(nonatomic, copy) NSString *bluetoothAction;
@property(nonatomic, copy) NSDate *wifiStartDate;
@property(nonatomic, copy) NSDate *bluetoothStartDate;
@property(nonatomic) NSInteger wifiIntervalDays;
@property(nonatomic) NSInteger bluetoothIntervalDays;

+ (instancetype)loadConfig;
- (void)save;
@end

NS_ASSUME_NONNULL_END
