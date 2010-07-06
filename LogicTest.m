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
	STAssertTrue(FALSE, @"Breaking build on purpose.");
}

- (void) testSucceed {
	STAssertTrue(TRUE, @"");
}

- (void) testAgain {
	STAssertTrue(TRUE, @"");
}


@end
