//
//  MockStackOverflowManagerDelegate.h
//  BrowseOverflow
//
//  Created by Vasile Croitoru on 26/04/16.
//  Copyright © 2016 Vasile Croitoru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowManager.h"


@interface MockStackOverflowManagerDelegate : NSObject<StackOverflowManagerDelegate>

@property (strong) NSError *fetchError;

@end
