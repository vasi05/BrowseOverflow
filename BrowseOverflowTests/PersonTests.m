//
//  PersonTests.m
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 24/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonTests : XCTestCase{
    Person *person;
}

@end

@implementation PersonTests

-(void)setUp{
    [super setUp];
    person = [[Person alloc] initWithName:@"Vasile Croitoru" avatarLocation:@"www.example.com/avatar.png"];
}

-(void)testThatPersonHaveTheRightName{
    XCTAssertEqualObjects(person.name, @"Vasile Croitoru", @"expecting a person providing his name");
}

-(void)testThatPersonHaveAnAvatarURL{
    NSURL *url = person.avatarURL;
    XCTAssertEqualObjects([url absoluteString], @"www.example.com/avatar.png", @"the person avatar should be represented by a URL");
}

@end
