//
//  PNTClientTestCase.m
//  PubNub Tests
//
//  Created by Jordan Zucker on 4/20/16.
//
//

#import "PNTDeviceIndependentMatcher.h"
#import "PNTClientTestCase.h"

@interface PNTClientTestCase ()
@property (nonatomic, strong, readwrite) PNConfiguration *configuration;
@property (nonatomic, strong, readwrite) PubNub *client;

@end

@implementation PNTClientTestCase

- (void)setUp {
    [super setUp];
    [PNLog enabled:NO];
    self.configuration = [self clientConfiguration];
    self.client = [PubNub clientWithConfiguration:self.configuration];
}

- (void)tearDown {
    self.client = nil;
    [super tearDown];
}

- (BKRTestConfiguration *)testConfiguration {
    BKRTestConfiguration *defaultConfiguration = [super testConfiguration];
    defaultConfiguration.matcherClass = [PNTDeviceIndependentMatcher class];
    defaultConfiguration.beginRecordingBlock = nil;
    defaultConfiguration.endRecordingBlock = nil;
    defaultConfiguration.shouldSaveEmptyCassette = YES;
    defaultConfiguration.tearDownExpectationTimeout = 60.0;
    defaultConfiguration.requestMatchingFailedBlock = ^void (NSURLRequest *request) {
        NSLog(@"Failed to match request: %@", request);
        XCTFail(@"Failed to match request: %@", request);
    };
    return defaultConfiguration;
}

- (NSString *)publishChannel {
    return @"a";
}

- (NSString *)historyChannel {
    return @"a";
}

- (PNConfiguration *)clientConfiguration {
    
    PNConfiguration *configuration = [PNConfiguration configurationWithPublishKey:@"demo-36" subscribeKey:@"demo-36"];
    configuration.uuid = @"322A70B3-F0EA-48CD-9BB0-D3F0F5DE996C";
    configuration.origin = @"pubsub.pubnub.com";
    return configuration;
}

@end
