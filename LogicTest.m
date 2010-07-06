//
//  LogicTest.m
//  BasicLocationApp
//
//  Created by Brandon Alexander on 7/6/10.
//  Copyright 2010 While This, inc. All rights reserved.
//

#import "LogicTest.h"


@implementation LogicTest
- (void) testFail {
	STFail(@"This is going to fail.");
}

- (void) testSucceed {
	STAssertTrue(TRUE, @"");
}


@end
