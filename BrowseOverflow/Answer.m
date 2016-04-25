//
//  Answer.m
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 25/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import "Answer.h"

@implementation Answer
@synthesize accepted, writer, text, score;

-(NSComparisonResult)compare:(Answer *)otherAnswer{
    if(accepted && !otherAnswer.accepted){
        return NSOrderedAscending;
    }
    else{
        if(otherAnswer.accepted && !accepted){
            return NSOrderedDescending;
        }
    }
    
    if(score > otherAnswer.score){
        return NSOrderedAscending;
    }
    else{
        if(score < otherAnswer.score){
            return NSOrderedDescending;
        }
        else{
            return NSOrderedSame;
        }
    }
}

@end
