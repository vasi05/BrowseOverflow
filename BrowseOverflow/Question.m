//
//  Question.m
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 24/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import "Question.h"
#import "Answer.h"

@implementation Question
@synthesize date, title, score, answers;

-(instancetype)init{
    if(self == [super init]){
        answerSet = [[NSMutableSet alloc] init];
    }
    return self;
}

-(void)addAnswer:(Answer *)answer{
    [answerSet addObject:answer];
}

-(NSArray *)answers{
    return [[answerSet allObjects] sortedArrayUsingSelector:@selector(compare:)];
}

@end
