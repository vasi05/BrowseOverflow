//
//  MockStackOverflowCommunicator.m
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 26/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import "MockStackOverflowCommunicator.h"

@implementation MockStackOverflowCommunicator{
    BOOL wasAskedToFetchQuestions;
}

-(void)searchForQuestionsWithTag:(NSString *)tag{
    wasAskedToFetchQuestions = YES;
}

-(BOOL)wasAskedToFetchQuestions{
    return wasAskedToFetchQuestions;
}


@end
