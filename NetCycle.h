#import <Foundation/Foundation.h>

@interface NetCycle : NSObject

+ (instancetype)sharedInstance;

- (void)start;
- (void)stop;

@end
