//
//  PNTTestResult.m
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import "PNTTestResult.h"

@interface PNTTestResult ()
@property (nonatomic, readwrite, assign) NSInteger statusCode;
@property (nonatomic, readwrite, assign) PNOperationType operation;
@property (nonatomic, readwrite, strong) PubNub *client;

@end

@implementation PNTTestResult

- (instancetype)initWithClient:(PubNub *)client andPubNubResult:(id)pubNubResult {
    NSParameterAssert(client);
    NSParameterAssert(pubNubResult);
    self = [super init];
    if (self) {
        _client = client;
        _actualPubNubResult = (PNResult *)pubNubResult;
    }
    return self;
}

- (instancetype)initResultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType andPubNubResult:(PNResult *)pubNubResult {
    self = [self initWithClient:client andPubNubResult:pubNubResult];
    if (self) {
        _statusCode = statusCode;
        _operation = operationType;
    }
    return self;
}

+ (instancetype)resultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType andPubNubResult:(PNResult *)pubNubResult {
    return [[self alloc] initResultWithClient:client statusCode:statusCode operation:operationType andPubNubResult:pubNubResult];
}

- (NSObject *)pubNubResult {
    return self.actualPubNubResult;
}

- (NSArray<NSString *> *)keysToAssert {
    return @[
             @"statusCode",
             @"operation",
             ];
}

+ (NSString *)PubNubClassName {
    NSString *testClassName = NSStringFromClass(self);
    return [testClassName stringByReplacingOccurrencesOfString:@"TTest" withString:@""];
}

+ (Class)PubNubClass {
    return NSClassFromString([self PubNubClassName]);
}



@end
