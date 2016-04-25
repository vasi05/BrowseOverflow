//
//  AnswerTests.m
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 24/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Answer.h"

@interface AnswerTests : XCTestCase

@end

@implementation AnswerTests{
    Answer *answer, *otherAnswer;
}

- (void)setUp {
    [super setUp];
    answer = [[Answer alloc] init];
    answer.writer = [[Person alloc] initWithName:@"Vasile Croitoru" avatarLocation:@"example.com/avatar.png"];
    answer.score = @21;
    answer.text = @"This is the answer";
    otherAnswer = [[Answer alloc] init];
    otherAnswer.score = @21;
    otherAnswer.text = @"I have the answer you need";
}

-(void)testThatAnswerHasSomeText{
    XCTAssertEqualObjects(answer.text, @"This is the answer", @"answer has a text description");
}

-(void)testThatAPersonProvidedTheAnswer{
    XCTAssertTrue([answer.writer isKindOfClass:[Person class]], @"answer is provided by a person");
}

-(void)testThatAnswerHasAScore{
    XCTAssertTrue([answer.score intValue] == 21, @"answer's score can be retrieved");
}

-(void)testThatAnswerIsNotAcceptedByDefault{
    XCTAssertFalse(answer.accepted, @"answer is not accepted by default");
}

-(void)testThatAnswerCanBeAccepted{
    XCTAssertNoThrow(answer.accepted = YES, @"it is possible to accept an answer");
}

-(void)testThatAcceptedAnswerComesBeforeUnaccepted{
    otherAnswer.accepted = YES;
    otherAnswer.score = [NSNumber numberWithInt:[otherAnswer.score intValue] + 10];
    XCTAssertTrue([answer compare:otherAnswer] == NSOrderedDescending, @"accepted answer should come first");
    XCTAssertTrue([otherAnswer compare:answer] == NSOrderedAscending, @"unaccepted answer should come last");
}

-(void)testThatAnswerWithEqualScoreCompareEqually{
    XCTAssertTrue([answer compare:otherAnswer] == NSOrderedSame, @"each answer has the same rank");
    XCTAssertTrue([otherAnswer compare:answer] == NSOrderedSame, @"each answer has the same rank");
}

-(void)testThatAnswerWithHigherScoreComesBeforeLowerScore{
    otherAnswer.score = [NSNumber numberWithInt:[otherAnswer.score intValue] + 10];
    XCTAssertTrue([answer compare:otherAnswer] == NSOrderedDescending, @"the lower score comes after higher score");
    XCTAssertTrue([otherAnswer compare:answer] == NSOrderedAscending, @"the higher score comes before lower score");
}

- (void)tearDown {
    answer = nil;
    otherAnswer = nil;
    [super tearDown];
}


@end
