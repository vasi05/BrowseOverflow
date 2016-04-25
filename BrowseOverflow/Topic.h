//
//  Topic.h
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 24/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Question;

@interface Topic : NSObject

@property (readonly) NSString *name;
@property (readonly) NSString *tag;

-(instancetype)initWithName:(NSString *)newName tag:(NSString *)newTag;
-(NSArray *)recentQuestions;
-(void)addQuestion:(Question *)question;

@end
