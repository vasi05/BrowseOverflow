//
//  QuestionCreationTests.m
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 26/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StackOverflowManager.h"
#import "MockStackOverflowManagerDelegate.h"
#import "MockStackOverflowCommunicator.h"
#import "Topic.h"

@interface QuestionCreationTests : XCTestCase

@end

@implementation QuestionCreationTests{
    StackOverflowManager *manager;
}

- (void)setUp {
    [super setUp];
    manager = [[StackOverflowManager alloc] init];
}

- (void)tearDown {
    manager = nil;
    [super tearDown];
}

-(void)testNonConformingObjectsCannotBeDelegate{
    XCTAssertThrows(manager.delegate = (id<StackOverflowManagerDelegate>)[NSNull null],@"NSNull should not be used as delegate");
}

-(void)testConformingObjectsCanBeDelegate{
    id<StackOverflowManagerDelegate> delegate = [[MockStackOverflowManagerDelegate alloc] init];
    XCTAssertNoThrow(manager.delegate = delegate,@"object conforming to the delegate can be used as delegate");
}

-(void)testDelegateCanBeEqualToNil{
    XCTAssertNoThrow(manager.delegate = nil,@"manager delegate can be equal to nil");
}

//-(void)testAskingForQuestionMeansRequestingData{
//    MockStackOverflowCommunicator * communicator = [[MockStackOverflowCommunicator alloc] init];
//    manager.communicator = communicator;
//    Topic *topic = [[Topic alloc] initWithName:@"iPhone" tag:@"iphone"];
//    [manager fetchQuestionOnTopic:topic];
//    XCTAssertTrue([communicator wasAskedToFetchQuestions],@"the communicator should need to fetch data");
//}
//
//- (void)testErrorReturnedToDelegateIsNotErrorNotifiedByCommunicator {
//    MockStackOverflowManagerDelegate *delegate = [[MockStackOverflowManagerDelegate alloc] init];
//    manager.delegate = delegate;
//    NSError *underlyingError = [NSError errorWithDomain: @"Test domain" code: 0 userInfo: nil];
//    [manager searchingForQuestionsFailedWithError: underlyingError];
//    XCTAssertFalse(underlyingError == [delegate fetchError],@"Error should be at the correct level of abstraction");
//}
//
//- (void)testErrorReturnedToDelegateDocumentsUnderlyingError { MockStackOverflowManagerDelegate *delegate =
//    [[MockStackOverflowManagerDelegate alloc] init];
//    manager.delegate = delegate;
//    NSError *underlyingError = [NSError errorWithDomain: @"Test domain"
//                                                   code: 0 userInfo: nil];
//    [manager searchingForQuestionsFailedWithError: underlyingError];
//    XCTAssertEqualObjects([[[delegate fetchError] userInfo]objectForKey: NSUnderlyingErrorKey], underlyingError,@"The underlying error should be available to client code");
//}

@end
