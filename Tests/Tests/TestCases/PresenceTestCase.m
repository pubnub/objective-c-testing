//
//  PresenceTestCase.m
//  Tests
//
//  Created by Jordan Zucker on 7/14/16.
//  Copyright © 2016 Jordan Zucker. All rights reserved.
//

#import <PubNubTesting/PubNubTesting.h>

@interface PresenceTestCase : PNTClientTestCase

@end

@implementation PresenceTestCase

- (BOOL)isRecording {
    return YES;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGlobalHereNow {
    NSDictionary<NSString *, NSDictionary *> *channels = @{
                                                           @"a" : @{
                                                                   @"uuids" : @[
                                                                           @{
                                                                               @"uuid" : @"d063790a-5fac-4c7b-9038-b511b61eb23d"
                                                                               }
                                                                           ],
                                                                   @"occupancy" : @1
                                                                   }
                                                           };
    PNTTestPresenceGlobalHereNowResult *expectedResult = [PNTTestPresenceGlobalHereNowResult successfulGlobalHereNowResultWithClient:self.client channels:channels totalOccupancy:@1 totalChannels:@1];
    [self.client hereNowWithCompletion:[self PNT_globalHereNowCompletionBlockWithExpectedHereNowResult:expectedResult andExpectedError:nil]];
    [self PNT_waitFor:kPNTPresenceTimeout];
}

- (void)testGlobalHereNowWithVerbosityUUID {
    NSDictionary<NSString *, NSDictionary *> *channels = @{
                                                           @"a" : @{
                                                                   @"uuids" : @[
                                                                           @{
                                                                               @"uuid" : @"d063790a-5fac-4c7b-9038-b511b61eb23d"
                                                                               }
                                                                           ],
                                                                   @"occupancy" : @1
                                                                   }
                                                           };
    PNTTestPresenceGlobalHereNowResult *expectedResult = [PNTTestPresenceGlobalHereNowResult successfulGlobalHereNowResultWithClient:self.client channels:channels totalOccupancy:@1 totalChannels:@1];
    [self.client hereNowWithVerbosity:PNHereNowUUID completion:[self PNT_globalHereNowCompletionBlockWithExpectedHereNowResult:expectedResult andExpectedError:nil]];
    [self PNT_waitFor:kPNTPresenceTimeout];
}

- (void)testHereNowForChannel {
    id uuids = @{
                 @"what": @"this",
                 };
    PNTTestPresenceChannelHereNowResult *expectedResult = [PNTTestPresenceChannelHereNowResult successfulChannelHereNowResultWithClient:self.client uuids:uuids occupancy:@1];
    [self.client hereNowForChannel:@"a" withCompletion:[self PNT_channelHereNowCompletionBlockWithExpectedHereNowResult:expectedResult andExpectedError:nil]];
    [self PNT_waitFor:kPNTPresenceTimeout];
}

- (void)testHereNowForChannelWithVerbosityUUID {
    id uuids = @{
                 @"what": @"this",
                 };
    PNTTestPresenceChannelHereNowResult *expectedResult = [PNTTestPresenceChannelHereNowResult successfulChannelHereNowResultWithClient:self.client uuids:uuids occupancy:@1];
    [self.client hereNowForChannel:@"a" withVerbosity:PNHereNowUUID completion:[self PNT_channelHereNowCompletionBlockWithExpectedHereNowResult:expectedResult andExpectedError:nil]];
    [self PNT_waitFor:kPNTPresenceTimeout];
}

//- (void)testHereNowForNilChannel {
//    PNTTestErrorStatus *
//    [self.client hereNowForChannel:@"a" withVerbosity:PNHereNowUUID completion:[self PNT_channelHereNowCompletionBlockWithExpectedHereNowResult:expectedResult andExpectedError:nil]];
//    [self PNT_waitFor:kPNTPresenceTimeout];
//}

- (void)testWhereNowUUID {
    NSArray<NSString *> *channels = @[
                                      @"a",
                                      ];
    PNTTestPresenceWhereNowResult *expectedResult = [PNTTestPresenceWhereNowResult successfulWhereNowResultWithClient:self.client channels:channels];
    [self.client whereNowUUID:self.client.uuid withCompletion:[self PNT_whereNowCompletionBlockWithExpectedHereNowResult:expectedResult andExpectedError:nil]];
    [self PNT_waitFor:kPNTPresenceTimeout];
}

//- (void)testWhereNowNilUUID {
//    
//}

@end
