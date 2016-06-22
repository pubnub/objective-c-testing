//
//  PNTTestErrorStatus.m
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import "PNTTestErrorStatus.h"

@implementation PNTTestErrorStatus

- (instancetype)initErrorWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category {
    self = [super initWithClient:client statusCode:statusCode operation:operationType category:category isError:YES];
    return self;
}

+ (instancetype)errorWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category {
    return [[self alloc] initErrorWithClient:client statusCode:statusCode operation:operationType category:category];
}

@end
