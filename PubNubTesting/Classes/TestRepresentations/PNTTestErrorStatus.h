//
//  PNTTestErrorStatus.h
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import "PNTTestStatus.h"

@interface PNTTestErrorStatus : PNTTestStatus <PNTTestRepresentation>

- (instancetype)initErrorWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category;
+ (instancetype)errorWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category;

@end
