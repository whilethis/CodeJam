//
//  LogicTest.m
//  BasicLocationApp
//
//  Created by Brandon Alexander on 7/6/10.
//  Copyright 2010 While This, inc. All rights reserved.
//

#import "LogicTest.h"
#import "Classes/LocationMapAnnotation.h"

@implementation LogicTest
- (void) testFail {
	STAssertTrue(TRUE, @"Breaking build on purpose.");
}

- (void) testSucceed {
	STAssertTrue(TRUE, @"");
}

- (void) testLocationMapAnnotation {
	LocationMapAnnotation *annotation = [[LocationMapAnnotation alloc] init];
	[annotation setTitle:@"Annotation title"];
	
	STAssertEquals([annotation title], @"Annotation title", @"Titles do not match");
}


@end
