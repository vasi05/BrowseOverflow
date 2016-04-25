//
//  Person.m
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 24/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize name,avatarURL;

-(instancetype)initWithName:(NSString *)newName avatarLocation:(NSString *)avatarLocation{
    if(self == [super init]){
        name = newName;
        avatarURL = [NSURL URLWithString:avatarLocation];
    }
    return self;
}

@end
