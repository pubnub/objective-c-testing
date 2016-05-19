//
//  PNTTestStatus.h
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import "PNTTestResult.h"

@interface PNTTestStatus : PNTTestResult

@property (nonatomic, readonly, assign) PNStatusCategory category;
@property (nonatomic, readonly, assign, getter = isError) BOOL error;

- (instancetype)initWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError;
+ (instancetype)statusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError;

@end
