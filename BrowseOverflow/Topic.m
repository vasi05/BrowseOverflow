//
//  Topic.m
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 24/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import "Topic.h"
#import "Question.h"

@implementation Topic{
    NSArray * questions;
}
@synthesize name,tag;

-(instancetype)initWithName:(NSString *)newName tag:(NSString *)newTag{
    if(self == [super init]){
        name = newName;
        tag = newTag;
        questions = [[NSArray alloc] init];
    }
    return self;
}

-(NSArray *)recentQuestions{
  return  [self sortQuestionsLatestFirst:questions];
}

-(void)addQuestion:(Question *)question{
   NSArray *newQuestions = [questions arrayByAddingObject:question];
    if(newQuestions.count > 20){
        newQuestions = [self sortQuestionsLatestFirst:newQuestions];
        newQuestions = [newQuestions subarrayWithRange:NSMakeRange(0, 20)];
    }
    questions = newQuestions;
}

-(NSArray *)sortQuestionsLatestFirst:(NSArray *)questionList{
    return [questionList sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        Question *q1 = (Question *)obj1;
        Question *q2 = (Question *)obj2;
        return [q2.date compare:q1.date];
    }];

}
@end
