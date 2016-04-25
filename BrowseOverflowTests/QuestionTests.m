//
//  QuestionTests.m
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 24/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Question.h"
#import "Answer.h"

@interface QuestionTests : XCTestCase{
    Question *question;
    Answer *lowScore;
    Answer *highScore;
}

@end

@implementation QuestionTests

-(void)setUp{
    [super setUp];
    question = [[Question alloc] init];
    question.date = [NSDate distantPast];
    question.title = @"Do Iphones also dream of electric sheep";
    question.score = @42;
    
    Answer *accepted = [[Answer alloc] init];
    accepted.score = @1;
    accepted.accepted = YES;
    [question addAnswer:accepted];
    
    lowScore = [[Answer alloc] init];
    lowScore.score = @-4;
    [question addAnswer:lowScore];
    
    highScore = [[Answer alloc] init];
    highScore.score = @4;
    [question addAnswer:highScore];
    
}

-(void)tearDown{
    question = nil;
    highScore = nil;
    lowScore = nil;
    [super tearDown];
}

-(void)testQuestionCanHaveAnswerAdded{
    Answer * myAnswer = [[Answer alloc] init];
    XCTAssertNoThrow([question addAnswer:myAnswer],@"must be able to add answer");
}

-(void)testAcceptedAnswerIsFirst{
    XCTAssertTrue([question.answers[0] isAccepted], @"Accepted answer comes first");
}

-(void)testHighScoreAnswerBeforeLow{
    NSArray *answears = question.answers;
    NSInteger highIndex = [answears indexOfObject:highScore];
    NSInteger lowIndex = [answears indexOfObject:lowScore];
    XCTAssertTrue(lowIndex < highIndex, @"high-scoring answer comes first");
}

-(void)testQuestionHasADate{
    NSDate *testDate = [NSDate distantPast];
    question.date = testDate;
    XCTAssertEqualObjects(question.date, testDate, @"question need to provide its date");
}

-(void)testQuestionsKeepScore{
    XCTAssertEqualObjects(question.score, @42, @"question need a numeric score");
}

-(void)testQuestionHasATitle{
    XCTAssertEqualObjects(question.title, @"Do Iphones also dream of electric sheep", @"question should know its title");
}

@end
