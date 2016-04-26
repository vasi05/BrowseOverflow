//
//  MockStackOverflowCommunicator.h
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 26/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowCommunicator.h"

@interface MockStackOverflowCommunicator :StackOverflowCommunicator

-(BOOL)wasAskedToFetchQuestions;

@end
