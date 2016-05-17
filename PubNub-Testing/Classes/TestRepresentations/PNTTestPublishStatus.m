//
//  PNTTestPublishStatus.m
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import "PNTTestPublishStatus.h"

@interface PNTTestPublishStatus ()
@property (nonatomic, readwrite, strong) NSNumber *timetoken;
@end

@implementation PNTTestPublishStatus

- (instancetype)initPublishStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode isError:(BOOL)isError timeToken:(NSNumber *)timeToken {
    self = [super initAcknowledgmentStatusWithClient:client statusCode:statusCode operation:PNPublishOperation isError:isError];
    if (self) {
        _timetoken = timeToken;
    }
    return self;
}

+ (instancetype)successfulStatusWithClient:(PubNub *)client timeToken:(NSNumber *)timeToken {
    return [[self alloc] initPublishStatusWithClient:client statusCode:200 isError:NO timeToken:timeToken];
}

+ (instancetype)failedStatusWithClient:(PubNub *)client timeToken:(NSNumber *)timeToken {
    return [[self alloc] initPublishStatusWithClient:client statusCode:400 isError:YES timeToken:timeToken];
}

- (NSArray<NSString *> *)keysToAssert {
    return @[
             @"timetoken"
             ];
}

//- (void)PNT_assertWithPubNubObject:(PNResult *)result {
//    [super PNT_assertWithPubNubObject:result];
//    XCTAssertTrue([result isKindOfClass:[PNPublishStatus class]]);
//    PNPublishStatus *status = (PNPublishStatus *)result;
//    XCTAssertEqualObjects(self.timetoken, status.data.timetoken);
//}

@end
