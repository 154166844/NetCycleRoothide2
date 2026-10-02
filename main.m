#import <Foundation/Foundation.h>
#import "NCScheduler.h"

int main(int argc, char *argv[]) {
    @autoreleasepool {
        NCScheduler *scheduler = [NCScheduler new];
        [scheduler start];

        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
