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
    return NO;
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
                                                           @"pubnub-portal-client-bronze-blocks": @{
                                                                   @"uuids": @[
                                                                           @"b058d970-8969-4cc4-a3ac-3680ab63acaa",
                                                                           ],
                                                                   @"occupancy": @1,
                                                                   },
                                                           @"demo": @{
                                                                   @"uuids": @[
                                                                           @"22094b94-34b2-4ba7-a294-6a1699d399c4",
                                                                           ],
                                                                   @"occupancy": @1,
                                                                   },
                                                           @"pubnub-portal-silver-blocks": @{
                                                                   @"uuids": @[
                                                                           @"b058d970-8969-4cc4-a3ac-3680ab63acaa",
                                                                           ],
                                                                   @"occupancy": @1,
                                                                   },
                                                           @"pubnub-portal-client-silver-blocks": @{
                                                                   @"uuids": @[
                                                                           @"b058d970-8969-4cc4-a3ac-3680ab63acaa",
                                                                           ],
                                                                   @"occupancy": @1,
                                                                   },
                                                           @"pubnub-portal-bronze-blocks": @{
                                                                   @"uuids": @[
                                                                           @"b058d970-8969-4cc4-a3ac-3680ab63acaa",
                                                                           ],
                                                                   @"occupancy": @1,
                                                                   },
                                                           @"webinar-chat": @{
                                                                   @"uuids": @[
                                                                           @"3fef5bd7-386e-4954-81c9-94f55ec0480f",
                                                                           @"3c9779c4-a041-4da3-b6c7-cefc71b25a61",
                                                                           @"8bcf78fb-120d-4d8f-98c2-e3a9cc6c60b9",
                                                                           ],
                                                                   @"occupancy": @3,
                                                                   },
                                                           @"ch-tukunare": @{
                                                                   @"uuids": @[
                                                                           @"d302cfdb-2174-484f-a884-676549a1cacb",
                                                                           ],
                                                                   @"occupancy": @1,
                                                                   },
                                                           @"pubnub-portal-client-gold-blocks": @{
                                                                   @"uuids": @[
                                                                           @"b058d970-8969-4cc4-a3ac-3680ab63acaa",
                                                                           ],
                                                                   @"occupancy": @1,
                                                                   },
                                                           @"pubnub-portal-gold-blocks": @{
                                                                   @"uuids": @[
                                                                           @"b058d970-8969-4cc4-a3ac-3680ab63acaa",
                                                                           ],
                                                                   @"occupancy": @1,
                                                                   },
                                                           @"moonlight-filter-check": @{
                                                                   @"uuids": @[
                                                                           @"68",
                                                                           ],
                                                                   @"occupancy": @1,
                                                                   },
                                                           @"foo.*": @{
                                                                   @"uuids": @[
                                                                           @"A67C206A-5B98-4A10-8C46-E4A07769132F",
                                                                           @"61666D4B-7C7F-420C-A9A2-CD43F8F445DD",
                                                                           @"BC84B690-FB9A-4797-BBCD-D6A5CEF1C759",
                                                                           ],
                                                                   @"occupancy": @3,
                                                                   },
                                                           };
    PNTTestPresenceGlobalHereNowResult *expectedResult = [PNTTestPresenceGlobalHereNowResult successfulGlobalHereNowResultWithClient:self.client channels:channels totalOccupancy:@15 totalChannels:@11];
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

- (void)testHereNowForNilChannel {
    PNTTestErrorStatus *errorStatus = [PNTTestErrorStatus failedBadRequestStatusWithClient:self.client operation:PNHereNowForChannelOperation];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    [self.client hereNowForChannel:nil withVerbosity:PNHereNowUUID completion:[self PNT_channelHereNowCompletionBlockWithExpectedHereNowResult:nil andExpectedError:errorStatus]];
#pragma clang diagnostic pop
    [self PNT_waitFor:kPNTPresenceTimeout];
}

- (void)testWhereNowUUID {
    NSArray<NSString *> *channels = @[
                                      @"a",
                                      ];
    PNTTestPresenceWhereNowResult *expectedResult = [PNTTestPresenceWhereNowResult successfulWhereNowResultWithClient:self.client channels:channels];
    [self.client whereNowUUID:self.client.uuid withCompletion:[self PNT_whereNowCompletionBlockWithExpectedHereNowResult:expectedResult andExpectedError:nil]];
    [self PNT_waitFor:kPNTPresenceTimeout];
}

- (void)testWhereNowNilUUID {
    PNTTestErrorStatus *errorStatus = [PNTTestErrorStatus failedBadRequestStatusWithClient:self.client operation:PNWhereNowOperation];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    [self.client whereNowUUID:nil withCompletion:[self PNT_whereNowCompletionBlockWithExpectedHereNowResult:nil andExpectedError:errorStatus]];
#pragma clang diagnostic pop
    [self PNT_waitFor:kPNTPresenceTimeout];
}

@end
