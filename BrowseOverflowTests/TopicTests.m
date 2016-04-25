//
//  TopicTests.m
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 24/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Topic.h"
#import "Question.h"

@interface TopicTests : XCTestCase{
    Topic * topic;
}

@end

@implementation TopicTests

-(void)setUp{
    [super setUp];
    topic = [[Topic alloc] initWithName:@"iPhone" tag:@"iphone"];
}

-(void)tearDown{
    topic = nil;
}

-(void)testThatTopicExists{
    XCTAssertNotNil(topic,@"should be able to create a Topic instance");
}

-(void)testThatTopicCanBeNamed{
    XCTAssertEqualObjects(topic.name, @"iPhone", @"the topic should have the name I gave it");
}

-(void)testThatTopicHasATag{
    XCTAssertEqualObjects(topic.tag, @"iphone", @"the topic should have the tag I gave it");
}

-(void)testForAListOfQuestions{
    XCTAssertTrue([[topic recentQuestions] isKindOfClass:[NSArray class]],@"topics should provide a list of recent questions");
}

-(void)testForInitialEmptyQuestionList{
    NSNumber * numberOfQuestions = [NSNumber numberWithInteger:[[topic recentQuestions] count]];
    XCTAssertEqualObjects(numberOfQuestions, @0, @"No questions added yet, count should be zero");
}

-(void)testAddingAQuestionToTheList{
    Question *question = [[Question alloc] init];
    [topic addQuestion: question];
    NSNumber * numberOfQuestions = [NSNumber numberWithInteger:[[topic recentQuestions] count]];
    XCTAssertEqualObjects(numberOfQuestions, @1, @"Add a question so the number of questions should be 1");
}

-(void)testQuestionsAreListedChronologically{
    Question *q1 = [[Question alloc] init];
    q1.date = [NSDate distantPast];
    
    Question *q2 = [[Question alloc] init];
    q2.date = [NSDate distantFuture];
    
    [topic addQuestion:q1];
    [topic addQuestion:q2];
    
    Question *listedFirst = [[topic recentQuestions] firstObject];
    Question *listedSecond = [[topic recentQuestions] lastObject];
    
    XCTAssertEqualObjects([listedFirst.date laterDate:listedSecond.date],listedFirst.date,@"The Later question should appear first in the list");
}

-(void)testLimitOfTwentyQuestions{
    for (int i=0; i<25; i++) {
        Question * question = [[Question alloc] init];
        [topic addQuestion:question];
    }
    NSInteger numberOfQuestions = [[topic recentQuestions] count];
    XCTAssertTrue(numberOfQuestions < 21, @"Number of questions must not be over 20");
}

@end
