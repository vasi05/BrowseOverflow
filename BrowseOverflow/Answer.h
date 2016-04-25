//
//  Answer.h
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 25/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Answer : NSObject

@property (readwrite) NSString *text;
@property (readwrite) Person *writer;
@property (readwrite) NSNumber *score;
@property (readwrite, getter=isAccepted) BOOL accepted;

-(NSComparisonResult)compare:(Answer *)otherAnswer;

@end
