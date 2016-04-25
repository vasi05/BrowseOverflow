//
//  Question.h
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 24/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Answer;

@interface Question : NSObject{
    NSMutableSet *answerSet;
}

@property (retain) NSDate *date;
@property (readwrite) NSNumber *score;
@property (copy) NSString *title;
@property (readonly) NSArray *answers;

-(void)addAnswer:(Answer *)answer;

@end
