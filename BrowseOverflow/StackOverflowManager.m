//
//  StackOverflowManager.m
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 26/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import "StackOverflowManager.h"
#import "StackOverflowCommunicator.h"
#import "Topic.h"

NSString *StackOverflowManagerError = @"StackOverflowManagerError";

@implementation StackOverflowManager

@synthesize delegate,communicator;

-(void)setDelegate:(id<StackOverflowManagerDelegate>)newDelegate{
    if(newDelegate && ![newDelegate conformsToProtocol:@protocol(StackOverflowManagerDelegate)]){
        [[NSException exceptionWithName: NSInvalidArgumentException reason:
          @"Delegate object does not conform to the delegate protocol" userInfo: nil] raise];
    }
    delegate = newDelegate;
}

-(void)fetchQuestionOnTopic:(Topic *)topic
            failedWithError:(NSError *)error{
    [communicator searchForQuestionsWithTag:topic.tag];
}

- (void)searchingForQuestionsFailedWithError:(NSError *)error {
    NSDictionary *errorInfo = [NSDictionary dictionaryWithObject: error forKey: NSUnderlyingErrorKey];
    NSError *reportableError = [NSError
                                errorWithDomain: StackOverflowManagerSearchFailedError
                                code: StackOverflowManagerErrorQuestionSearchCode userInfo:errorInfo];
    [delegate fetchingQuestionsOnTopic: nil failedWithError: reportableError];
}

@end
