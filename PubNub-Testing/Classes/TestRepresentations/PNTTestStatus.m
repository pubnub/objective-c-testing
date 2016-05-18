//
//  PNTTestStatus.m
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import "PNTTestStatus.h"

@interface PNTTestStatus ()
@property (nonatomic, readwrite, assign) PNStatusCategory category;
@property (nonatomic, readwrite, assign, getter = isError) BOOL error;

@end

@implementation PNTTestStatus

- (instancetype)initWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError {
    self = [super initWithClient:client statusCode:statusCode operation:operationType];
    if (self) {
        _category = category;
        _error = isError;
    }
    return self;
}

+ (instancetype)statusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType category:(PNStatusCategory)category isError:(BOOL)isError {
    return [[self alloc] initWithClient:client statusCode:statusCode operation:operationType category:category isError:isError];
}

- (NSArray<NSString *> *)keysToAssert {
    NSMutableArray *superKeys = [super keysToAssert].mutableCopy;
    [superKeys addObjectsFromArray:@[
                                     @"category",
                                     @"error"
                                     ]];
    return superKeys.copy;
}

//- (void)PNT_assertWithPubNubObject:(PNResult *)result {
//    [super PNT_assertWithPubNubObject:result];
//    XCTAssertTrue([result isKindOfClass:[PNStatus class]]);
//    PNStatus *status = (PNStatus *)result;
//    XCTAssertEqual(self.category, status.category);
//    XCTAssertEqual(self.isError, status.isError);
//}



@end
