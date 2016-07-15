//
//  PNTClientChannelGroupTestCase.m
//  Pods
//
//  Created by Jordan Zucker on 7/14/16.
//
//

#import "PNTClientChannelGroupTestCase.h"
#import "XCTestCase+PNTChannelGroup.h"

@implementation PNTClientChannelGroupTestCase

- (void)setUp {
    [super setUp];
    if (self.shouldRunChannelGroupSetUp) {
        NSDictionary<NSString *, NSArray<NSString *> *> *groups = [self channelGroups];
        if (groups) {
            PNTWeakify(self);
            [groups enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSArray<NSString *> * _Nonnull obj, BOOL * _Nonnull stop) {
                PNTStrongify(self);
                [self PNT_removeChannelGroup:key forClient:self.client];
                if (obj.count) {
                    [self PNT_addChannels:obj toGroup:key forClient:self.client];
                } else {
                    NSLog(@"Can't add empty channels to group called: %@", key);
                }
            }];
        }
    }
}

- (void)tearDown {
    if (self.shouldRunChannelGroupTearDown) {
        NSDictionary<NSString *, NSArray<NSString *> *> *groups = [self channelGroups];
        if (groups) {
            PNTWeakify(self);
            [groups enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSArray<NSString *> * _Nonnull obj, BOOL * _Nonnull stop) {
                PNTStrongify(self);
                [self PNT_removeChannelGroup:key forClient:self.client];
            }];
        }
    }
    [super tearDown];
}

- (NSDictionary<NSString *, NSArray<NSString *> *> *)channelGroups {
    return @{
             };
}

- (NSString *)presenceChannelGroup {
    return nil;
}

- (BOOL)shouldRunChannelGroupSetUp {
    return YES;
}

- (BOOL)shouldRunChannelGroupTearDown {
    return YES;
}

@end
