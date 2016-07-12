//
//  PNTTestResult.h
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import "PNTTestRepresentation.h"

@class PNResult;

@interface PNTTestResult : NSObject <PNTTestRepresentation>

@property (nonatomic, readonly, assign) NSInteger statusCode;
@property (nonatomic, readonly, assign) PNOperationType operation;
@property (nonatomic, strong, readonly) PNResult *actualPubNubResult;

- (instancetype)initWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType andPubNubResult:(PNResult *)pubNubResult;

+ (instancetype)resultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType andPubNubResult:(PNResult *)pubNubResult;

@end
