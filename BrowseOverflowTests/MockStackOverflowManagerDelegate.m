//
//  MockStackOverflowManagerDelegate.m
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 26/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import "MockStackOverflowManagerDelegate.h"


@implementation MockStackOverflowManagerDelegate
@synthesize fetchError;

- (void)fetchingQuestionsOnTopic: (Topic *)topic
                 failedWithError: (NSError *)error {
    self.fetchError = error;
}

@end
