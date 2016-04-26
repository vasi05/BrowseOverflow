//
//  StackOverflowManager.h
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 26/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StackOverflowCommunicator;
@class Topic;

extern NSString *StackOverflowManagerError;
enum {
    StackOverflowManagerErrorQuestionSearchCode
};

@protocol StackOverflowManagerDelegate<NSObject>

@end

@interface StackOverflowManager : NSObject

@property (weak, nonatomic) id<StackOverflowManagerDelegate> delegate;
@property (strong) StackOverflowCommunicator *communicator;

-(void)fetchQuestionOnTopic:(Topic *)topic
            failedWithError:(NSError *)error;

@end
