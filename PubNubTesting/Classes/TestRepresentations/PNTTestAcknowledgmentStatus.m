//
//  PNTTestAcknowledgmentStatus.m
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import "PNTTestAcknowledgmentStatus.h"

@implementation PNTTestAcknowledgmentStatus

- (instancetype)initAcknowledgmentStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType isError:(BOOL)isError {
    self = [super initWithClient:client statusCode:statusCode operation:operationType category:PNAcknowledgmentCategory isError:isError];
    return self;
}

+ (instancetype)acknowledgmentStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType isError:(BOOL)isError {
    return [[self alloc] initAcknowledgmentStatusWithClient:client statusCode:statusCode operation:operationType isError:isError];
}

+ (instancetype)channelGroupAddWithClient:(PubNub *)client {
    return [self acknowledgmentStatusWithClient:client statusCode:200 operation:PNAddChannelsToGroupOperation isError:NO];
}

+ (instancetype)channelGroupRemoveWithClient:(PubNub *)client {
    return [self acknowledgmentStatusWithClient:client statusCode:200 operation:PNRemoveChannelsFromGroupOperation isError:NO];
}

+ (instancetype)channelGroupRemoveAllChannelsWithClient:(PubNub *)client {
    return [self acknowledgmentStatusWithClient:client statusCode:200 operation:PNRemoveGroupOperation isError:NO];
}

//- (NSArray<NSString *> *)keysToAssert {
//    NSMutableArray *superKeys = [super keysToAssert].mutableCopy;
//    [superKeys addObjectsFromArray:@[
//                                     @"class",
//                                     ]];
//    return superKeys.copy;
//}

//- (void)PNT_assertWithPubNubObject:(PNResult *)result {
//    [super PNT_assertWithPubNubObject:result];
//    XCTAssertTrue([result isKindOfClass:[PNAcknowledgmentStatus class]]);
//    PNAcknowledgmentStatus *status = (PNAcknowledgmentStatus *)result;
//}

@end
